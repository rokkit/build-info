class InformMail < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :sms_body, :user, :user_id
  
  after_create :send_email_and_sms
  
  private
  
  def send_email_and_sms
    Sms.inform user.phone, sms_body if sms_body.present?
    # InformMailer.inform(user.email, body).deliver if body.present?
  end
end