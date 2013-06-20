require 'csv'
class ReesterObject < ActiveRecord::Base
  belongs_to :distinct
  attr_accessible :address, :apartement_number, :area, :cadaster_number, :cost, :cost_one_meter, :reester_id, :distinct_id
end
