module MetaAttribute
  class MetaAttributeEntityGroup < ActiveRecord::Base
    attr_accessible :group_name, :parent_table, :visible, :parent_table_pk

    has_many :meta_attribute_entities,
      :foreign_key=>:meta_attribute_entity_group_group_name, #their field
      :primary_key=>:group_name, #my field
      :inverse_of=>:meta_attribute_entity_group

    has_many :meta_attribute_questions, :through=>:meta_attribute_entities

    validates_presence_of :group_name
    validates_presence_of :parent_table
    validates_presence_of :parent_table_pk

    validate :validate_table_and_pk

    rails_admin do
      field :visible
      field :parent_table, :enum
      field :parent_table_pk, :enum
      field :group_name
      field :meta_attribute_entities
      list do
        field :id
      end
    end

    # Require that table exists and that column exists in table
    def validate_table_and_pk
      if parent_table.nil?
        parent_table_pk=nil
        return
      end

      if parent_table_pk.nil?
        parent_table=nil
        return
      end

      debugger
      unless parent_table_enum.include? parent_table.to_s
        errors.add :parent_table, :invalid
        return
      end
      unless parent_table_pk_enum.include? parent_table_pk.to_s
        errors.add :parent_table_pk, :invalid
        return
      end
    end

    def parent_table_enum
      # No enum unless a group name is listed
      return [] unless group_name
      return ActiveRecord::Base.connection.tables.select{|tname|tname.starts_with? 'p4_'}
    end

    def parent_table_pk_enum
      return [] unless parent_table
      ActiveRecord::Base.connection.columns(parent_table).map{|col|col.name}
    end

    def title
      group_name
    end

    def parent_group
      # I am a group of entities
      # Look for an entity that has an entity_type with my parent table name
      # Take the entity_group of that entity if it exists
      MetaAttribute::MetaAttributeEntityGroup.
        joins(:meta_attribute_entities).
        where('meta_attribute_entities.entity_type'=>parent_table).first
    end

  end
end
