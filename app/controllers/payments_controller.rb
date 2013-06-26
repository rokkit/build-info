class PaymentsController < InheritedResources::Base
  def create
    @payment = Payment.new params[:payment]
    @payment.account = current_user.account
    create! notice: "Платёж обрабатывается"
  end
end
