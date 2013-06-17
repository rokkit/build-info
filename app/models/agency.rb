class Agency < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :employes, class_name: "User"
  attr_accessible :description, :name, :phone, :fax, :address, :logo, :site, :remote_logo_url
  
  validates :name,:phone, :address, presence: true
  
  mount_uploader :logo, LogoUploader
  def to_s
    name
  end
end
