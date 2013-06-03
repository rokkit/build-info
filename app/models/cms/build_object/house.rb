class House < ActiveRecord::Base
  belongs_to :type_of_house
  belongs_to :material
  belongs_to :overlap
  belongs_to :stair
  belongs_to :basement
  belongs_to :user
  has_one :address
  attr_accessible :bank, :builder, :busstop, :byear, :chute, :clinic, 
                  :consierge, :domesticserv, :elevator, :hfirstfloor, 
                  :kgarten, :name, :overhault, :park, :parking, :phrmacy, 
                  :school, :shopping, :shopprod, :type_of_house_id, :material_id,
                  :overlap_id, :stair_id, :basement_id, :user_id, :terms_id, :price,:address_attributes,
                  :photos_attributes
                  
  has_many :photos, :dependent => :destroy 
  accepts_nested_attributes_for :photos, :address
end
