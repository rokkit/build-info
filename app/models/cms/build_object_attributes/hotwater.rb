class Hotwater < ActiveRecord::Base
  # attr_accessible :title, :body
  def to_s
    name
  end
end
