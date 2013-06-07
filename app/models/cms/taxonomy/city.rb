class City < ActiveRecord::Base
  belongs_to :region
  attr_accessible :name, :region_id
  has_many :distincts
  def to_s
    name
  end
end
