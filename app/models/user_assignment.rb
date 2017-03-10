class UserAssignment < ActiveRecord::Base
attr_accessible :user_id, :survey_assignment_id, :lime_token_tid
belongs_to :user
belongs_to :survey_assignment
has_one :lime_survey, :through=>:survey_assignment
validates_uniqueness_of :user_id, :scope=>:survey_assignment_id
rails_admin do
field :user do
inline_add false
end
field :lime_token_tid do
read_only true
end
end

def title
user.present? ? user.email : ''
end

def token
@token ||= survey_assignment.
lime_survey.lime_tokens.pluck(:tid, :token).
find{|tid, token| tid.to_i == lime_token_tid.to_i}.last
end

def sid
survey_assignment.lime_survey.sid
end

def url
"#{Settings.lime_url}/index.php/survey/index/sid/#{sid}/token/#{token}/lang/#{lang}"
end

def new_url
"#{url}/newtest/Y"
end

def lang
token_data['language']
end

##
# returns {} of token table data
def token_data
@token_data ||= survey_assignment.
lime_survey.lime_tokens.add_filter(:token, lime_token_tid).dataset.first
end

##
# returns {} of response table data
def response_data
@response_data ||= survey_assignment.
lime_survey.lime_data.add_filter(:token, token).dataset.first
end

def completed?
# nil/'' means invalid
!['N' ].include?(token_data['completed'])
end

def completed
token_data['completed']
end

def started?
response_data.present?
end

def status_str
started? ? (completed? ? 'complete' : 'started' ) : 'not started'
end

def peer_data

end

end
