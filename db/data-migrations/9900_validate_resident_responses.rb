# send log message
def log(msg,model)
    puts "#{msg}, #{model.class.name}, #{model.p4_program_id}, #{model.contclin}, #{model.abfm_last_four}"   
end

# Match each survey to a resident, check for errors
def validate_resident_survey model

    # What ID do we use to mark ambiguous users?
    err_res_id = P4Resident.find_by_p4_program_id('#999')['id']
    # Get list of all surveys, and look for duplicate survey entries
    if not model.column_names.index('abfm_last_four2').nil?
        # In rails 2.3 the select method is private
        # So either use rails 3.2 or use the find method
        # model.find( :all,
        #     :select=>'count(*) as xcount, p4_program_id, contclin, abfm_last_four, abfm_last_four2',
        #     :group:=>'p4_program_id,contclin,abfm_last_four,abfm_last_four2,p4_resident_id'
        # )
        surveys = model.select('count(*) as xcount, p4_program_id, contclin, abfm_last_four, abfm_last_four2').group('p4_program_id,contclin,abfm_last_four,abfm_last_four2,p4_resident_id')
    else
        surveys = model.select('count(*) as xcount, p4_program_id, contclin, abfm_last_four').group('p4_program_id,contclin,abfm_last_four,p4_resident_id')
    end

    surveys.each do |survey|
        abfm_last_four = survey.abfm_last_four.to_s.rjust(4,'0')
        if survey.attributes.has_key? 'abfm_last_four2'
            abfm_last_four_old = survey.abfm_last_four2.to_s.rjust(4,'0')
        else
            abfm_last_four_old = abfm_last_four
        end

        # look for matching resident 
        residents = P4Resident.joins(:p4_resident_clinics).
            where(["(abfm_last_four = ? OR abfm_last_four_old = ?) AND p4_resident_clinics.p4_clinic_id = ?",abfm_last_four,abfm_last_four_old,survey.contclin])

        log_msgs = []
        # Multiple surveys have the same identifying information
        if survey.xcount.to_i != 1
            resident = P4Resident.find(err_res_id)
            log_msgs += [["Duplicate Surveys found",survey]]
        end
    
        if residents.count == 0
        # No matching resident
            resident = P4Resident.find(err_res_id)
            log_msgs += [['No matching user', survey]]
        elsif residents.count > 1
        # This survey can me matched to more than one resident
            resident = P4Resident.find(err_res_id)
            log_msgs += [['Matched multiple users', survey]]
        else
            resident =  residents[0]
        end
    
        # Update survey records to point to the correct resident
        if abfm_last_four == abfm_last_four_old
                conditions= ['p4_program_id= ? AND (abfm_last_four = ?) AND contclin=?', 
                    survey.p4_program_id,abfm_last_four,survey.contclin ]
        else
                conditions= ['p4_program_id= ? AND (abfm_last_four=? OR abfm_last_four2 = ?) AND contclin=?', 
                    survey.p4_program_id,abfm_last_four,abfm_last_four_old,survey.contclin ]
        end

        responses = model.where(conditions) 
        
        responses.each do |response|
            if not response.p4_resident_id.nil? and response.p4_resident_id != err_res_id
                log_msgs = []
                log "Manually Matched: #{response.p4_resident_id}", response
                next
            end
            response.p4_resident_id = resident[:id]
            response.save!
        end
    
        log_msgs.each do |arr|
            log arr[0],arr[1]
        end

    end
end

###############
# Main - Run through resident response tables trying to match each survey to a participant
###############
puts "msg, survey, p4_program_id, contclin, abfm_last_four"

[
    Y1ResidentResponse,
    Y2ResidentResponse,
    Y3ResidentResponse,
    Y4ResidentResponse,
    Y5ResidentResponse

].each do |model|
    validate_resident_survey model
end
