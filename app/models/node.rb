class Node < ActiveRecord::Base
  belongs_to :sell, class_name: 'BuildObject'
  belongs_to :buy, class_name: 'BuildObject'
  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :build_objects
  attr_accessible :sell_id, :buy, :addresses_attributes,:comment, :max_area, :max_kitchen_area, :max_living_area, :max_price, :max_rooms, :min_area, :min_kitchen_area, :min_living_area, :min_price, :min_rooms, :status
  
  accepts_nested_attributes_for :addresses
  
  validates :sell_id, presence: true
  
  #Проверка возмжности обмена, объект не должен участвовать в цепочке, как покупаемый
  def self.existing? build_object
    !where(buy_id: build_object).empty?
  end
  
  def human_status
    if status == 0
      "Свободно"
    elsif status == 1
      "Подан запрос на обмен"
    elsif status == 2
      "Обмен успешен"
    elsif status == 3
      "Предложение отклонено"
    end
  end
  
  def request_for_exchange build_object
    self.build_objects << build_object
    update_attribute(:status, 1)
    save!
  end
  
  #имеет право владелец объекта покупки
  def accept_request_for_exchange! build_object
    self.status == 2
    self.buy = build_object
    #все остальные предложения с данным объектом отмечаются как отклонённые
    update_all({status: 1, sell_id: self.sell}, {status: 3})
    save!
  end
  
  #имеет право владелец объекта покупки
  def reject_request_for_exhange!
    self.status == 3
    save!
  end
  
end
