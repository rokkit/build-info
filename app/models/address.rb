class Address < ActiveRecord::Base
  belongs_to :country
  belongs_to :region
  belongs_to :city
  belongs_to :distinct
  belongs_to :street
  attr_accessible :bus, :description, :ipoteka, :metro, :minibus, :number_house, :number_korp, :railsbus, :trolleybus,
  :country_id, :region_id, :city_id, :distinct_id, :street_id
end
