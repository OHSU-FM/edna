module EdnaConsole
  module RailsAdmin
    #
    def self.load_extensions
      # Iterate through all models
      ActiveRecord::Base.descendants.each do |model|
        if model.name.include? 'P4'
          model.send :include, EdnaConsole::RailsAdmin::P4CoreTablesMixin
          next
        end
        %w(ContinuityClinic ResidentResponse GraduateResponse).each do |model_part|
          if model.name.include? model_part
            model.send :include, EdnaConsole::RailsAdmin::SurveyResponseMixin
          end
        end
      end
    end

    module P4CoreTablesMixin
      extend ActiveSupport::Concern
      included do
        rails_admin do
          visible true
          navigation_label "P4"
          include_all_fields
        end
      end
    end

    module SurveyResponseMixin
      extend ActiveSupport::Concern
      included do
        # Get nav label for survey
        category = self.name.sub(/^Y\d+/, '').underscore.sub('_', ' ')
        rails_admin do
          visible true
          navigation_label "#{category} Surveys"
          #weight @@ra_position
          list do
            sort_by :p4_program_id
          end
          include_all_fields

        end

      end
    end
  end
end

