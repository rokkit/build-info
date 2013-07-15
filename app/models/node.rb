class Node < ActiveRecord::Base
  belongs_to :sell, class_name: 'BuildObject'
  belongs_to :buy, class_name: 'BuildObject' #связь между нодой и объектом при обмене обратной продажи на конечную
  
  has_many :relationships
  has_many :nodes, through: :relationships
  
  has_one :inverse_relationship, :class_name => "Relationship", :foreign_key => "node_two_id"
  has_one :inverse_node, :through => :inverse_relationship, :source => :node
    
  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :build_objects
  attr_accessible :sell_id, :buy, :addresses_attributes,:comment, :max_area, :max_kitchen_area, :max_living_area, :max_price, :max_rooms, :min_area, :min_kitchen_area, :min_living_area, :min_price, :min_rooms, :status
  
  accepts_nested_attributes_for :addresses
  
  validates :sell_id, presence: true
  
  sifter :address_matched do |addresses|
    country_id != null
  end
  
  scope :matched_by_node, -> (node) do
    nodes = where { min_price >= node.min_price && max_price <= node.max_price }
    nodes = nodes.includes(:addresses).where { 
      ( addresses.country_id == node.sell.address.street_id )
    }
  end
  
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
      "Обмен состоялся"
    elsif status == 3
      "Предложение отклонено"
    end
  end
  
  def request_for_exchange build_object
    self.build_objects << build_object
    update_attribute(:status, 1)
    save!
  end
  def request_for_exchange_by_node node
    #self.build_objects << node.sell
    r = self.relationships.build :node_two_id => node.id
    r.save!
    update_attribute(:status, 1)
    save!
  end
  
  #имеет право владелец объекта покупки
  def accept_request_for_exchange! build_object
    self.status = 2
    self.buy = build_object
    self.selled_at = Time.zone.now
    build_object.nodes.each do |node|
      node.destroy if node.sell != self.sell
    end
    #все остальные предложения с данным объектом отмечаются как отклонённые
    Node.update_all({status: 1, sell_id: self.sell}, {status: 3})
  end
  
  def accept_request_for_exchange_by_node! node
    self.status = 2
    node.update_attribute :status, 2
    # self.buy = node.sell
    # node.buy = self.sell
    node.sell.update_attribute :selled_at, DateTime.now
    self.sell.update_attribute :selled_at, DateTime.now
    #r = Relationship.where(node_id: self, node_two_id: node)
    Relationship.delete_all ["node_id = ? AND node_two_id != ?", self.id, node.id]
    
    #все остальные предложения с данным объектом отмечаются как отклонённые
    Node.update_all({status: 1, sell_id: self.sell}, {status: 3})
  end
  
  #имеет право владелец объекта покупки
  def reject_request_for_exhange!
    self.status == 3
    save!
  end
  
  def self.match node
    includes(:sell).matched_by_node @node
  end
  
end
