class RobokassaController < ApplicationController
  include ActiveMerchant::Billing::Integrations

  #skip_before_filter :verify_authenticity_token # skip before filter if you chosen POST request for callbacks

  #before_filter :create_notification
  before_filter :find_payment

  # Robokassa call this action after transaction
  def paid
    notification = Robokassa.notification request.raw_post, :secret => APP['robokassa']["secret_2"]
    if notification.acknowledge # check if it’s genuine Robokassa request
      #@payment.approve! # project-specific code
      render :text => notification.success_response
    else
      head :bad_request
    end
  end

  # Robokassa redirect user to this action if it’s all ok
  def success
    notification = Robokassa.notification request.raw_post, :secret => APP['robokassa']["secret"]
    
    if !@payment.approved? && notification.acknowledge
      @payment.approve!
      redirect_to @payment, :notice => "#{request.raw_post}"
    end
      redirect_to @payment, :notice => "#{request.raw_post}"
  end
  # Robokassa redirect user to this action if it’s not
  def fail
    redirect_to @payment, :notice => "Robokassa fail"
  end

  private

  def create_notification
    @notification = Robokassa::Notification.new(request.raw_post, :secret => APP['robokassa']['secret'])
  end

  def find_payment
    @payment = Payment.find(params[:InvId])
  end
end
