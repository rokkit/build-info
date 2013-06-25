class Photo < ActiveRecord::Base
  attr_accessible :image, :remote_image_url
  belongs_to :build_object
  mount_uploader :image, PhotoUploader
end
