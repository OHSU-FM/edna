class UserAssignment < ActiveRecord::Base
    attr_accessible :user_id, :survey_assignment_id, :lime_token_tid
    belongs_to :user
    belongs_to :survey_assignment
    has_one :lime_survey, :through=>:survey_assignment
    validates_uniqueness_of :user_id, :scope=>:survey_assignment_id

    rails_admin do
        navigation_label "User Content"
        
        field :user do
            inline_add false
        end
        field :lime_token_tid do
            read_only true
        end
    end

    def token_attrs; lime_survey.token_attrs; end       # Hash: Attribute names
    def lime_tokens; lime_survey.lime_tokens; end       # String: Alias token object
    def lang; token_data[:language]; end                # String: language of response
    def token; token_data[:token]; end                  # String: token of survey
    def sid; lime_survey.sid; end                       # Int: sid of survey
    def completed; token_data[:completed]; end          # String: raw completed val
    def completed?; !['N' ].include?(completed); end    # Binary: completed val
    def new_url; "#{url}/newtest/Y"; end                # String: URL of new survey
    def started?; response_data.present?; end           # Binary: Has survey response started?    

    ##
    # base URL of survey
    def url
        "#{Settings.lime_url}/index.php/survey/index/sid/#{sid}/token/#{token}/lang/#{lang}"
    end
 
    ##
    # returns {} of token table data
    def token_data
        @token_data ||= HashWithIndifferentAccess.new(
          lime_tokens.add_filter(:tid, lime_token_tid).dataset.first || {}
        )
    end
   
    ##
    # returns {} of response table data
    def response_data
        @response_data ||= survey_assignment.
            lime_survey.lime_data.add_filter(:token, token).dataset.first
    end

    def status_str
        started? ? (completed? ? 'complete' : 'started' ) : 'not started'
    end
        
end
