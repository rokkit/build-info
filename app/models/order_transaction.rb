class OrderTransaction < ActiveRecord::Base
  belongs_to :payment
  attr_accessible :action, :amount, :authorization, :message, :params, :payment_id, :success, :payment
end
