module EdnaConsole
  # Class: DataMaker
  #
  # The DataMaker class is an SQL query generator that is used to create datasets that are used with the Chart model
  # and the associated Chart Builder web interface.
  #
  # TODO: Insert stub data when missing questions
  class DataMaker
    attr_reader :query, :questions

    # TODO: Remove Ugly hack and add to relations table
    PKEYS = {
      'p4_residents'=>'p4_program_id',
      'p4_programs'=>'p4_program_id',
      'p4_clinics'=>'p4_program_id'
    }
    FKEYS = {
      'p4_residents'=>'p4_resident_id',
      'p4_programs'=>'p4_program_id',
      'p4_clinics'=>'settingid'
    }

    def initialize questions
      # select only series that are ready for data
      @questions = questions
    end

    ##
    # Create dataset or return a cached copy of it
    def dataset
      @dataset ||= generate_dataset
    end

    ##
    # Re/Generate the dataset and convert/map the dataset to an array of arrays
    # with the column headers as the first row
    def generate_dataset
      return nil if query.nil?
      # execute the query
      data = Array ActiveRecord::Base.connection.execute(query)
      return [] if data.empty?
      # Convert the query into an easy to read format
      @dataset = [data.first.keys]+data.map{|dd|dd.values}
      return @dataset
    end

    ##
    # Check query type
    def query_type
      # Execute appropriate query builder
      return groups.size if groups.size <= 1
      return 2 if groups.size > 1
      raise 'Series Error'
    end

    ##
    # Convert the query_type to its string representation
    def query_type_str
      query_type_enum[query_type]
    end

    ##
    # Generate query for these questions
    def query
      case query_type_str
      when 'empty'
        return
      when 'iso'
        return iso_query_builder
      when 'multi'
        return multi_query_builder
      end
    end

    ##
    # Produce enumerator for query_type
    def query_type_enum
      return {
        0=>'empty',
        1=>'iso',
        2=>'multi'
      }
    end

    ##
    # Show details for questions
    def question_details
      result = []
      entities.each do |entity|
        group = entity.meta_attribute_entity_group
        result.push({
          :questions=>questions_for_entity(entity).map{|q|q.attribute_name},
          :table=>entity.entity_type,
          :year=>entity.reference_year,
          :group=>group.group_name,
          :parent_table=>group.parent_table,
          :link_to=>(group.parent_group.nil? ? nil : group.parent_group.parent_table)
        })
      end
      result
    end

    protected

    # Find the number of unique entity groups in all series
    def groups
      @groups ||= questions.map{|question|question.meta_attribute_entity_group}.uniq
    end

    # List all of the entities
    def entities
      @entities ||= questions.map{|question|question.meta_attribute_entity}.uniq
    end

    # List all of the table names associated with this data maker query
    def table_names
      @table_names ||= entities.map{|entity|entity.model.table_name}.uniq
    end

    # get all of the columns for this group
    def cols_for_group group
      result = []
      questions.each do |q|
        result.push q if q.meta_attribute_entity_group == group
      end
      return result.uniq
    end

    # Get all of the entities for this group that we also have questions for
    def entities_for_group group
      questions_for_group(group).map{|questions|questions.meta_attribute_entity}.uniq
    end

    # get all of the questions for this group
    def questions_for_group group
      questions.select{|question|question.meta_attribute_entity_group==group}
    end

    # get all of the questions for this entity
    def questions_for_entity entity
      questions.select{|question|question.meta_attribute_entity==entity}
    end

    # get all of the column names (unique)
    def q_columns
      @q_columns ||= questions.map{|question|question.attribute_name}.uniq
    end

    ##
    # Query builder used when there is only a single data source
    def iso_query_builder
      group_alias = "#{groups.first.parent_table}"
      attrs = questions.map{|question|"\"#{question.attribute_name}\""}.uniq
      return "SELECT
      #{attrs.join(',')}, year
FROM (#{group_query_builder groups.first}) AS #{group_alias}"
    end

    ##
    # Query builder used when there are multiple types of data sources
    def multi_query_builder

      query = "
SELECT
      #{select_arr.join(",\n\t")}
FROM \t#{groups.first.parent_table}
      #{pk_join_arr.join("\n")}
      #{fk_join_arr.join("\n")};"

      return query
    end

    ##
    # Variables for SELECT statement
    def select_arr
      result = []
      result.push "#{groups.first.parent_table}_0_fk.year"              # Manually add the year of the survey
      # for each group
      groups.each_with_index do |group, idx|
        group_alias = "#{group.parent_table}_#{idx}"            # Calculate the group alias for this table
        # all questions for this group
        questions = questions_for_group(group).uniq{|question|question.attribute_name}
        questions.each do |question|
          col_name  = "#{group_alias}_fk.#{question.attribute_name}"  #
          result.push col_name
        end
      end
      return result
    end

    ##
    # Variables for primary key joins
    def pk_join_arr
      result = []
      joined_tables = [groups.first.parent_table]
      groups.each_with_index do |group, idx|
        next if idx == 0
        next if joined_tables.include? group.parent_table
        joined_tables.push group.parent_table
        group_alias = "#{group.parent_table}_#{idx}"
        result.push "\nJOIN #{group.parent_table}\n\tON #{group.parent_table}.#{PKEYS[group.parent_table]} = #{group.parent_group.parent_table}.#{group.parent_group.parent_table_pk}\n"
      end
      return result
    end

    ##
    # Variables for foreign key joins
    def fk_join_arr
      result = []
      groups.each_with_index do |group, idx|
        group_alias = "#{group.parent_table}_#{idx}"
        group_query = group_query_builder(group)
        result.push "JOIN (\n#{group_query}\n\t) AS #{group_alias}_fk"
        result.push "ON #{group_alias}_fk.#{FKEYS[group.parent_table]}=#{group.parent_table}.#{group.parent_table_pk}"
        if idx > 0
          groups.each_with_index do |x_group, x_idx|
            #next if x_idx < idx
            x_group_alias = "#{x_group.parent_table}_#{x_idx}"
            result.push "\tAND #{x_group_alias}_fk.year = #{group_alias}_fk.year"
            break
          end
        end
      end
      return result
    end

    ##
    # Collect all of the columns that we need to select for this group
    def group_query_builder group
      query_arr = []
      g_question_names = questions_for_group(group).map{|question|sanitize(question.attribute_name)}.uniq

      entities_for_group(group).each do |entity|
        cols = []
        e_question_names = questions_for_entity(entity).map{|question|sanitize(question.attribute_name)}

        #
        g_question_names.each do |q_name|
          if e_question_names.include? q_name
            cols.push "CAST(\"#{q_name}\" AS FLOAT) AS \"#{q_name}\""
          else
            cols.push "CAST(888 AS FLOAT) AS #{q_name}"
          end
        end

        #
        cols.push "#{entity.reference_year} AS year" unless entity.reference_year.nil?
        cols.push sanitize(entity.entity_type_fk)

        # convert to sql
        query_arr.push "SELECT \n\t#{cols.join(",\n\t")} \nFROM #{entity.entity_type}"
      end

      return query_arr.join("\nUNION ALL\n")
    end

    ##
    # sanitize sql variable
    #
    def sanitize input
      input.to_s.gsub(/^A-Za-z0-9_/,'')
    end

  end
end
