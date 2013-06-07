class Distinct < ActiveRecord::Base
  belongs_to :city
  attr_accessible :name, :city_id
  has_many :streets
  def to_s
    name
  end
end
