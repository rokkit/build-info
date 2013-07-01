class PaymentsController < InheritedResources::Base
  before_filter :authenticate_user!
  def create
    @payment = Payment.new params[:payment]
    @payment.account = current_user.account
    create! notice: "Платёж обрабатывается"
  end
end
