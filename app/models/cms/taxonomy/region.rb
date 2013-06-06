class Region < ActiveRecord::Base
  belongs_to :country
  attr_accessible :name, :country_id
  has_many :cities
  def to_s
    name
  end
end
