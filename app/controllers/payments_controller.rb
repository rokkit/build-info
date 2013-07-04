class PaymentsController < InheritedResources::Base
  before_filter :authenticate_user!
  def create
    @payment = Payment.new params[:payment]
    @payment.account = current_user.account
    create! notice: "Платёж обрабатывается"
  end
  
  def pay_for_rating
    @action = Variables.find_by_key :buy_rating
    if request.post?
      result_price = params[:count_rating].to_f * @action.value.to_f
      if result_price <= current_user.account.total.to_f
        current_user.add_rating! :buy_rating, params[:count_rating].to_f
        current_user.account.decrement(:total, result_price).save
        redirect_to cabinet_index_path, notice: "Ваше рейтинг увеличен!"
      else
        flash[:notice] = "Недостаточно средств на счету! Необходимо #{result_price}"
        render :pay_for_rating
      end
    end
  end
end
