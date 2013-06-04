class Appartement < ActiveRecord::Base
  belongs_to :planning
  belongs_to :toilet
  belongs_to :remont
  belongs_to :hotwater
  belongs_to :view_from_windows
  belongs_to :house
  attr_accessible :area, :balkon, :floor, :hfloor, :kitchen_area, :living_area, :rooms,
                  :planning_id, :remont_id, :hotwater_id, :view_from_windows_id, :house_id, :terms_id
end
