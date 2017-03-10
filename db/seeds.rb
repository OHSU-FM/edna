module EdnaDbSeeder
    
    @@non_exportable = [
        :abfm_last_four2, :abfm_last_four, :abfmresidencyid,
        :age, :contclin, :graduateid, :id, :p4_program_id,
        :p4_resident_id, :p4resid, :p4residency_abfm_id, :settingid
    ]

    # Create All questions
    def self.refresh_questions entity
        # Get all questions 
        vals = MetaAttribute::MetaAttributeStatistic.uniq.select([
            :entity_name,
            :attribute_name,
            :attribute_description,
            :attribute_data_type,
            :is_continuous]).where(:entity_name=>entity.entity_type)
        vals.each do |val|
            attr_name = val.attribute_name 
            # determine if visible
            visible = @@non_exportable.include?(attr_name.to_sym) ? false : true
            visible = false if val.attribute_data_type == 'character varying'
            # recover options for question 
            options_hash = question_options_to_json entity.entity_type, attr_name
            # Create question if it does not exist
            question = entity.meta_attribute_questions.where(
                :attribute_name=>val.attribute_name,
                :description=>val.attribute_description,
                :continuous=>val.is_continuous,
                :data_type=>val.attribute_data_type,
                :visible=>visible,
                :options_hash=>options_hash
            ).first_or_create
        end
    end

    def self.question_options_to_json entity_name, attribute_name
        # Pull all of the data about answers
        return MetaAttribute::MetaAttributeValue.all(
            :select=>'DISTINCT value, value_description as description',
            :conditions=>{
                :entity_name=>entity_name,
                :attribute_name=>attribute_name
        }).to_json
    end

    def self.refresh_categories
        # Load category data
        data = YAML.load(File.read("#{Rails.root}/db/seeds/meta_attribute_categories.yml"))
        data.each do |category_name, attribute_name, entity_type|
            question = MetaAttribute::MetaAttributeQuestion.find_by_attribute_name(
                attribute_name,
                :include=>:meta_attribute_entity,
                :conditions=>["meta_attribute_entities.entity_type = ?", entity_type]
            )
            raise "Missing question:#{entity_group}-#{attribute_name}" if question.nil?
            question.update_attributes(:category=>category_name)
        end
    end

    def self.run
        ActiveRecord::Base.transaction do
            MetaAttribute::MetaAttributeEntity.delete_all
            MetaAttribute::MetaAttributeQuestion.delete_all

            entities_data = YAML.load(File.read("#{Rails.root}/db/seeds/meta_attribute_entities.yml"))
        
            entities_data.each do |entity_hash|
                mae = MetaAttribute::MetaAttributeEntity.create(entity_hash) 
                self.refresh_questions mae
            end
        end
        self.refresh_categories
    end

end

EdnaDbSeeder.run
