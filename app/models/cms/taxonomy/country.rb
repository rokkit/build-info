class Country < ActiveRecord::Base
  attr_accessible :name, :id
  has_many :regions
  validates :name, uniqueness: true, presence: true
  def to_s
    name
  end
end
