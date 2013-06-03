class Street < ActiveRecord::Base
  belongs_to :distinct
  attr_accessible :name, :distinct_id
end
