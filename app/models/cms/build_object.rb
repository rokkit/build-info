class BuildObject < ActiveRecord::Base
  
  belongs_to :type_of_build_object
  belongs_to :user
  has_many :photos, :dependent => :destroy 
  
  #house
  belongs_to :type_of_house
  belongs_to :material
  belongs_to :overlap
  belongs_to :stair
  belongs_to :basement
  has_one :address
  #end house
  
  #appartement
  belongs_to :planning
  belongs_to :toilet
  belongs_to :remont
  belongs_to :hotwater
  belongs_to :valute
  belongs_to :view_from_windows
  #end appartement
  
  attr_accessible :bank, :builder, :busstop, :byear, :chute, :clinic, 
                  :consierge, :domesticserv, :elevator, :hfirstfloor, 
                  :kgarten, :name, :overhault, :park, :parking, :phrmacy, 
                  :school, :shopping, :shopprod, 
                  :type_of_house_id, 
                  :material_id,
                  :overlap_id, 
                  :stair_id, 
                  :basement_id, 
                  :user_id, 
                  :terms_id, 
                  :price,
                  :address_attributes,
                  :photos_attributes,
                  :rating,
                  :ipoteka,
                  :valute_id,
                  :type_of_build_object_id
  
  accepts_nested_attributes_for :photos, :address
end
