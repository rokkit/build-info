class LinkedAccount < ActiveRecord::Base
  belongs_to :type_of_linked_account
  belongs_to :user
  attr_accessible :login, :password, :type_of_linked_account_id


end
