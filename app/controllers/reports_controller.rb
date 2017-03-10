class ReportsController < ApplicationController
    include ReportsHelper
    layout 'full_width'

    def index
        authorize! :read, :reports
      if current_user.admin_or_higher?
          redirect_to show_report_path(:id=>'A', :type=>'y7_graduate_responses')
      elsif current_user.p4_program_id.nil?
          render :file => File.join(Rails.root, 'public', '401.html')
      else
          redirect_to show_report_path(:id=>current_user.p4_program.alias, :type=>'y7_graduate_responses')
      end
    end

    def show
      authorize! :read, :reports

      # Columns to hide
      @hide_cols = %w(graduateid p4_program_id grad_year abfm_last_four paper finished max_slide created_at updated_at p4_resident_id id)

      # Get type
      @type = (params[:type] || :y1_continuity_clinics).to_s

      # Force non admins to view their own content
      if current_user.admin_or_higher?
          # set type
          @id = params[:id]
      elsif current_user.p4_program.nil? || current_user.p4_program.alias.nil?
          render :file => File.join(Rails.root, 'public', '401.html')
          return
      elsif current_user.p4_program && current_user.p4_program.alias != params[:id]
          redirect_to show_report_path(:id=>current_user.p4_program.alias, :type=>@type)
      else
          @id = params[:id]
      end
      
      # Collect list of all attributes for this @id and @type
      @attributes = MetaAttribute::MetaAttributeStatistic.
        includes(:meta_attribute_values).
        includes(:meta_attribute_question).
        where(:subset_id=>@id, :entity_name=>@type).
        where(['attribute_name NOT IN (?)', @hide_cols]).
        order(:attribute_index)
      # Remove all entires that are not visible
      @attributes = @attributes.select{|attr|attr.meta_attribute_question.nil? || attr.meta_attribute_question.visible==true}
      # Categorize attr/stats
      @sorter = ReportsHelper::MasSorter.new
      @sorter.add_statistics @attributes
      @sorter.count_categories!

      @all_types = MetaAttribute::MetaAttributeStatistic.uniq.pluck(:entity_name)
      hide_surveys = ['y1_webads_responses', 'y2_webads_responses']
      
      @type_select_data = [
          [ 'Continuity Clinic Survey Y1', 'y1_continuity_clinics' ],
          # [ 'Y1 WebADS Responses', 'y1_webads_responses' ],
          [ 'Continuity Clinic Survey Y2', 'y2_continuity_clinics' ],
          # [ 'Y2 WebADS Responses', 'y2_webads_responses' ],
          [ 'Continuity Clinic Survey Y3', 'y3_continuity_clinics' ],
          [ 'Continuity Clinic Survey Y4', 'y4_continuity_clinics' ],
          [ 'Continuity Clinic Survey Y5', 'y5_continuity_clinics' ],
          [ 'Resident Survey Y1', 'y1_resident_responses' ],
          [ 'Resident Survey Y2', 'y2_resident_responses' ],
          [ 'Resident Survey Y3', 'y3_resident_responses' ],
          [ 'Resident Survey Y4', 'y4_resident_responses' ],
          [ 'Resident Survey Y5', 'y5_resident_responses' ],
          [ 'Residency Program Survey Y1', 'y1_residency_programs' ],
          [ 'Residency Program Survey Y2', 'y2_residency_programs' ],
          [ 'Residency Program Survey Y3', 'y3_residency_programs' ],
          [ 'Residency Program Survey Y4', 'y4_residency_programs' ],
          [ 'Residency Program Survey Y5', 'y5_residency_programs' ],
          [ 'Graduate Survey Y1 - 2006 Graduates', 'y1_graduate_responses' ],
          [ 'Graduate Survey Y2 - 2007 Graduates', 'y2_graduate_responses' ],
          [ 'Graduate Survey Y3 - 2008 Graduates', 'y3_graduate_responses' ],
          [ 'Graduate Survey Y4 - 2009 Graduates', 'y4_graduate_responses' ],
          [ 'Graduate Survey Y5 - 2010 Graduates', 'y5_graduate_responses' ],
          [ 'Graduate Survey Y6 - 2011 Graduates', 'y6_graduate_responses' ],
          [ 'Graduate Survey Y7 - 2012 Graduates', 'y7_graduate_responses' ]
      ]

      @type_pdf_name = @type_select_data.select{ |item|
           item[1] == @type     
      }[0][0].underscore.gsub(/( |_)+/,'_')+'.pdf'

      @select_data = MetaAttribute::MetaAttributeStatistic.select(:subset_id).
        group(:subset_id).
        order(:subset_id).
        collect { |a| [ a.subset_id ] * 2}

      # The max number of years for year over year comparisons
      @max_year = 7
      #return self
    end


    def instrument
      @file_map = get_file_map
      @type = (params[:type] || :y1_continuity_clinics).to_s

      if (@file_map[@type])
        send_file @file_map[@type],
          :type => 'application/pdf', :disposition => 'inline'
      else
        redirect_to(:action => :index)
      end

    end

    # 
    helper_method :get_type_for_year
    def get_type_for_year(type, year)
      new_type = type.gsub(/^y\d+_/, "y#{year}_")
      return new_type if (get_file_map[new_type])
      return nil
    end

    helper_method :get_file_map
    def get_file_map
      return {
        'y1_residency_programs' =>
          "#{Rails.root}/../instruments/p4_y1_program_survey.pdf",
        'y1_continuity_clinics' =>
          "#{Rails.root}/../instruments/p4_y1_continuity_survey.pdf",
        'y1_resident_responses' =>
          "#{Rails.root}/../instruments/p4_y1_resident_survey.pdf",
        'y1_graduate_responses' =>
          "#{Rails.root}/../instruments/p4_2006_graduate_survey.pdf",
        'y2_residency_programs' =>
          "#{Rails.root}/../instruments/p4_y2_program_survey.pdf",
        'y2_continuity_clinics' =>
          "#{Rails.root}/../instruments/p4_y2_continuity_survey.pdf",
        'y2_resident_responses' =>
          "#{Rails.root}/../instruments/p4_y2_resident_survey.pdf",
        'y2_graduate_responses' =>
          "#{Rails.root}/../instruments/p4_2007_graduate_survey.pdf",
        'y3_residency_programs' =>
          "#{Rails.root}/../instruments/p4_y3_program_survey.pdf",
        'y3_continuity_clinics' =>
          "#{Rails.root}/../instruments/p4_y3_continuity_survey.pdf",
        'y4_residency_programs' =>
          "#{Rails.root}/../instruments/p4_y4_program_survey.pdf",
        'y4_continuity_clinics' =>
          "#{Rails.root}/../instruments/p4_y4_continuity_survey.pdf",
        'y4_resident_responses' =>
          "#{Rails.root}/../instruments/p4_y4_resident_survey.pdf",
        'y5_residency_programs' =>
          "#{Rails.root}/../instruments/p4_y5_program_survey.pdf",
        'y5_continuity_clinics' =>
          "#{Rails.root}/../instruments/p4_y5_continuity_survey.pdf",
        'y5_resident_responses' =>
          "#{Rails.root}/../instruments/p4_y5_resident_survey.pdf",
        'y3_resident_responses' =>
          "#{Rails.root}/../instruments/p4_y3_resident_survey.pdf",
        'y3_graduate_responses' =>
          "#{Rails.root}/../instruments/p4_2008_graduate_survey.pdf",
        'y4_graduate_responses' =>
          "#{Rails.root}/../instruments/p4_2009_graduate_survey.pdf",
        'y5_graduate_responses' =>
          "#{Rails.root}/../instruments/p4_2010_graduate_survey.pdf",
        'y6_graduate_responses' =>
          "#{Rails.root}/../instruments/p4_2011_graduate_survey.pdf",
        'y7_graduate_responses' =>
          "#{Rails.root}/../instruments/p4_2012_graduate_survey.pdf"
      }
    end

end

