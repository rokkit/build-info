class Review < ActiveRecord::Base
  belongs_to :user #записавшийся на просмотр
  belongs_to :build_object #объект просмотра
  #назначенная дата, статус заявки (1 - подана, 2 - подтверждена, 3 - выполнена)
  attr_accessible :date, :status
end
