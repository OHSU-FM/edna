module EdnaConsole
  module ArExtensions
    #
    def self.load_extensions
      # Iterate through all models
      ActiveRecord::Base.descendants.each do |model|
        if model.name.include? 'ResidentResponse'
          model.send :include, EdnaConsole::ArExtensions::ResidentResponseMixin
        end
        #if model.name.include? 'GraduateResponse'
        #    model.send :include, EdnaConsole::ArExtensions::GraduateResponseMixin
        #end

        #unless model.name.include?('MetaAttribute') || model.name.include?('Version') || model.name.include?('User')
        #    model.send :has_paper_trail
        #end
      end
    end

    module ResidentResponseMixin
      extend ActiveSupport::Concern
      included do
        belongs_to :p4_resident
      end
    end

    module GraduateResponseMixin
      extend ActiveSupport::Concern
      included do
        belongs_to :p4_resident
        belongs_to :p4_program, :through=>:p4_resident
      end
    end

    module P4ResidencyProgramResponseMixin
      extend ActiveSupport::Concern
      included do
        belongs_to :p4_program, :foreign_key=>:p4_program_id, :primary_key=>:p4_program_id
        rails_admin do
          navigation_label 'Program Response Surveys'
        end
      end
    end

    module P4ContinuityClinicResponseMixin
      extend ActiveSupport::Concern
      included do
        belongs_to :p4_clinic, :foreign_key=>:setting_id, :primary_key=>:p4_clinic_id
      end
    end



    module ActiveRecordImport
      extend ActiveSupport::Concern

      def self.import!(record_list)
        raise ArgumentError "record_list not an Array of Hashes" unless record_list.is_a?(Array) && record_list.all? {|rec| rec.is_a? Hash }
        return record_list if record_list.empty?

        (1..record_list.count).step(1000).each do |start|
          key_list, value_list = convert_record_list(record_list[start-1..start+999])
          sql = "INSERT INTO #{self.table_name} (#{key_list.join(", ")}) VALUES #{value_list.map {|rec| "(#{rec.join(", ")})" }.join(" ,")}"
          self.connection.insert_sql(sql)
        end

        return record_list
      end

      def self.convert_record_list(record_list)
        # Build the list of keys
        key_list = record_list.map(&:keys).flatten.map(&:to_s).uniq.sort

        value_list = record_list.map do |rec|
          list = []
          key_list.each {|key| list <<  ActiveRecord::Base.connection.quote(rec[key] || rec[key.to_sym]) }
          list
        end

        # If table has standard timestamps and they're not in the record list then add them to the record list
        time = ActiveRecord::Base.connection.quote(Time.now)
        for field_name in %w(created_at updated_at)
          if self.column_names.include?(field_name) && !(key_list.include?(field_name))
            key_list << field_name
            value_list.each {|rec| rec << time }
          end
        end

        return [key_list, value_list]
      end
    end

  end
end

