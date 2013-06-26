class Payment < ActiveRecord::Base
  belongs_to :payable, polymorphic: true
  belongs_to :account
  belongs_to :reason
  attr_accessible :amount, :comment, :payable_id, :payable_type, :reason_id, :status
  
  after_update :record_transaction
  
private
  def record_transaction
    if self.status # если пополнеие успешно то записать транзакцию
      OrderTransaction.create! payment: self, amount: self.amount 
      self.account.increment! :total, self.amount
    end
  end
end
