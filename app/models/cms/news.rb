class News < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :name
  def to_s
    name
  end
end
