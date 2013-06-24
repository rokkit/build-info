class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :async

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :rating, :fio, :phone,:name,
                  :role_ids, :forem_admin, :user_type, :photo
  attr_accessor :user_type
  
  belongs_to :type_user
  belongs_to :agency
  has_many :reviews
  # attr_accessible :title, :body
  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :roles
  
  before_create :set_rating
  after_create :send_devise_confirmation_by_sms
  
  mount_uploader :photo, LogoUploader
  
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s)
  end
  
  def to_s
    fio
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
  
  
  def send_devise_confirmation_by_sms 
    client = Twilio::REST::Client.new(APP['twilio']['sid'], APP['twilio']['token'])
    client.account.sms.messages.create(
      from: APP['twilio']['from'],
      to: "+#{self.phone}",
      body: "Код активации: #{self.confirmation_token}"
    )
  end
  
  def generate_confirmation_token
    self.confirmation_token = (0...5).map{ ('a'..'z').to_a[rand(26)] }.join
    self.confirmation_sent_at = Time.now.utc
  end
  
  private
  def set_rating
    self.rating = 0
  end
end
