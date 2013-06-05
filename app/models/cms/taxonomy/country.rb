class Country < ActiveRecord::Base
  attr_accessible :name
  has_many :regions
  def to_s
    name
  end
end
