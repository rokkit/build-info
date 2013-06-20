# encoding: UTF-8

class InformMailer < ActionMailer::Base
  default from: "indmaksim@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inform_mailer.incomin_request.subject
  #
  def incomin_request(request_meeting)
    @request_meeting = request_meeting

    mail to: "indmaksim@gmail.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inform_mailer.approve_request.subject
  #
  def approve_request review
    @review = review

    mail to: @review.user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inform_mailer.cancel_request.subject
  #
  def cancel_request request_meeting
    @request_meeting = request_meeting
    mail to: @request_meeting.user.email
  end
end
