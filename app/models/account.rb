class Account < ActiveRecord::Base
  belongs_to :accountable, polymorphic: true #принадлежит пользователю или агенству
  belongs_to :valute
  has_many :payments
  attr_accessible :total, #денег на счету
                  :valute_id
end
