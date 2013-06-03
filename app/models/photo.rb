class Photo < ActiveRecord::Base
  attr_accessible :image
  belongs_to :house
  mount_uploader :image, PhotoUploader
end
