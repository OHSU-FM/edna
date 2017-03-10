# send log message
def log(msg,model)
    puts "#{msg}, #{model.class.name}, #{model.p4_program_id}, #{model.abfm_last_four}"
end

# Match each survey to a resident, check for errors
def validate_resident_survey model
    
    # What ID do we use to mark ambiguous users?
    err_res_id = P4Resident.find_by_p4_program_id('#999')[:id]

    # Get list of all surveys, and look for duplicate survey entries
    # group by p4_resident_id so we don't get false positives on
    # manually mapped users
    if not model.column_names.index('abfm_last_four').nil?
        surveys = model.select('count(*) as xcount, p4_program_id, abfm_last_four, p4_resident_id').group('p4_program_id,abfm_last_four,p4_resident_id')
    else
        puts "No abfm_last_four in: #{model.class.name}"
        return
    end

    surveys.each do |survey|
        log_msgs = []
        # Manually matched survey
        if survey.p4_resident_id.nil? == false
            next
        end

        abfm_last_four = survey.abfm_last_four.to_s.rjust(4,'0')


        # look for matching resident 
        residents = P4Resident.where(
            ["
                (abfm_last_four = ? OR abfm_last_four_old = ?) 
                AND p4_program_id = ?
                ",
                abfm_last_four,abfm_last_four,survey.p4_program_id
            ]
        )

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
        conditions= ['p4_program_id= ? AND abfm_last_four = ?', 
            survey.p4_program_id,abfm_last_four ]

        responses = model.where(conditions) 
        
        responses.each do |response|
            #if response.p4_resident_id.nil? == false && response.p4_resident_id != err_res_id
            #    # This user was manually mapped, skip setting id and override log messages
            #    #log_msgs = []
            #    #log "Manually Matched: #{response.p4_resident_id}", response
            #    next
            #end
            response.p4_resident_id = resident[:id]
            response.save!
        end

        # Log messages 
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
    Y1GraduateResponse,
    Y2GraduateResponse,
    Y3GraduateResponse,
    Y4GraduateResponse,
    Y5GraduateResponse,
    Y6GraduateResponse,
    Y7GraduateResponse

].each do |model|
    validate_resident_survey model
end
