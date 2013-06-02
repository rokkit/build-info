class Term < ActiveRecord::Base
  belongs_to :valute
  attr_accessible :desciption, :ipoteka, :price, :valute_id
end
