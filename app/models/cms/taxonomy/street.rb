class Street < ActiveRecord::Base
  belongs_to :distinct
  attr_accessible :name, :distinct_id
  def to_s
    name
  end
end
