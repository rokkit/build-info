class Region < ActiveRecord::Base
  belongs_to :country
  attr_accessible :name, :country_id, :id
  has_many :cities
  validates :country, presence: true
  def to_s
    name
  end
end
