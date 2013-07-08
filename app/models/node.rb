class Node < ActiveRecord::Base
  belongs_to :sell, class_name: 'BuildObject'
  belongs_to :buy, class_name: 'BuildObject'
  has_and_belongs_to_many :addresses
  attr_accessible :sell_id, :buy, :addresses_attributes,:comment, :max_area, :max_kitchen_area, :max_living_area, :max_price, :max_rooms, :min_area, :min_kitchen_area, :min_living_area, :min_price, :min_rooms, :status
  
  accepts_nested_attributes_for :addresses
  
  validates :sell_id, presence: true
end
