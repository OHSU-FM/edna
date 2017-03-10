class SurveyAssignment < ActiveRecord::Base
attr_accessible :lime_survey_sid, :title, :gather_user_tokens, :user_assignments_attributes
attr_accessor :gather_user_tokens
serialize :shared_response_qids, Array

belongs_to :lime_survey, :primary_key=>:sid, :foreign_key=>:lime_survey_sid, :inverse_of=>:survey_assignments

has_many :user_assignments, :inverse_of=>:survey_assignment, :dependent=>:delete_all
has_many :users, :through=>:user_assignments

validates_presence_of :lime_survey_sid
validates_presence_of :title, :if=> Proc.new {|f| f.lime_survey_sid.present?}
accepts_nested_attributes_for :user_assignments, :allow_destroy=>true, :reject_if=>:all_blank

before_validation :do_default_title
after_validation :do_gather_user_tokens

rails_admin do
field :show_groups
field :title do
required false
end
field :lime_survey
field :gather_user_tokens, :boolean
field :user_assignments
field :shared_response_qids
end

def shared_response_qids_enum
return [] if lime_survey.nil?
lime_survey.parent_questions.map{|lq|["qid:#{lq.qid} title:#{lq.title}"]}
end

##
# Set the default title if one is not set during update
def do_default_title
if title.blank? && lime_survey_sid.present?
self[:title] = lime_survey.title
end
end

##
# Add user_assignments to all users that have a token for this survey
def do_gather_user_tokens
# Only do this if gather_user_tokens is truthy
return unless gather_user_tokens == '1'
tid_emails = lime_survey.lime_tokens.pluck :tid, :email

tid_emails = tid_emails - user_assignments.map{|ua|[ua.lime_token_tid, ua.user.email]}
User.where(:email=>tid_emails.map{|tid, email|email}).each do |user|
ua = user_assignments.build
ua.user_id = user.id
ua.lime_token_tid = tid_emails.find{|tid, email|user.email == email}.first
ua.save!
end
end


def shared_lime_questions
@shared_lime_questions ||= lime_survey.lime_questions.where(['lime_questions.qid IN (?)', shared_response_qids] )
end

end

