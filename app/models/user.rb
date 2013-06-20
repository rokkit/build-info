class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :rating, :fio, :phone,:name,
                  :role_ids, :forem_admin, :user_type
  attr_accessor :user_type
  
  belongs_to :type_user
  has_many :reviews
  # attr_accessible :title, :body
  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :roles
  
  before_create :set_rating
  
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s)
  end
  
  def to_s
    name
  end
  # def confirmation_required?
  #   false
  # end
  # def active_for_authentication?
  #   confirmed? || confirmation_period_valid?
  # end
  def approve!
    skip_confirmation!
    confirmed_at = Time.zone.now
    save!
  end
  
  def add_rating! reason
    if reason == :article
      self.rating += 1
    end
    save!
  end
  
  private
  def set_rating
    self.rating = 0
  end
end
