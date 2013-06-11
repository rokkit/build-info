class Review < ActiveRecord::Base
  belongs_to :user #записавшийся на просмотр
  belongs_to :build_object #объект просмотра
  #назначенная дата, статус заявки (1 - подана, 2 - подтверждена, 3 - выполнена)
  attr_accessible :date, :status, :build_object_id
  
  before_create :init_status
  
  scope :by_user, lambda {|user| where(user_id: user) }
  scope :by_object_owner, lambda {|user| joins(:build_object).where(build_objects: {user_id: user}) }
  
  def init_status
    self.status = 1
  end
  
  def accept!
    self.status = 2
    save!
  end
end
