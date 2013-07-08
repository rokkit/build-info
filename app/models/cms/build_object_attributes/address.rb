class Address < ActiveRecord::Base
    
  before_save :geocode_by_address
  
  belongs_to :country
  belongs_to :region
  belongs_to :city
  belongs_to :distinct
  belongs_to :street
  has_many :build_objects
  attr_accessible :bus, :description, :ipoteka, :metro, :minibus, :number_house, :number_korp, :railsbus, :trolleybus,
  :country_id, :region_id, :city_id, :distinct_id, :street_id, :build_object_id,
  :country, :region, :city, :distinct, :street, :build_object, :lat, :lng, :metro
  
  has_and_belongs_to_many :nodes
  
  #validates :country,:region, :city, :distinct, :number_house,  presence: true
  
  def to_s
    "#{street}, #{number_house}"
  end
private
  def geocode_by_address
    begin
      data = Geocoder.search("#{self.country} #{self.city} #{self.street} #{self.number_house}")
      self.lat, self.lng = data[0].latitude, data[0].longitude unless data.nil?
    rescue Exception #Адрес может быть не найден геокодером
      return true
    end
  end
end
