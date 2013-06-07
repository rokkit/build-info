class BuildObject < ActiveRecord::Base
  
  belongs_to :type_of_build_object
  belongs_to :user
  has_many :photos, :dependent => :destroy 
  
  #house
  belongs_to :type_of_house
  belongs_to :material
  belongs_to :overlap
  belongs_to :stair
  belongs_to :basement
  belongs_to :address
  #end house
  
  #appartement
  belongs_to :planning
  belongs_to :toilet
  belongs_to :remont
  belongs_to :hotwater
  belongs_to :valute
  belongs_to :view_from_windows
  #end appartement
  
  attr_accessible :bank, :builder, :busstop, :byear, :chute, :clinic, 
                  :consierge, :domesticserv, :elevator, :hfirstfloor, 
                  :kgarten, :name, :overhault, :park, :parking, :phrmacy, 
                  :school, :shopping, :shopprod, 
                  :type_of_house_id, 
                  :material_id,
                  :overlap_id, 
                  :stair_id, 
                  :basement_id, 
                  :user_id, 
                  :terms_id, 
                  :price,
                  :address_attributes,
                  :photos_attributes,
                  :rating,
                  :ipoteka,
                  :valute_id,
                  :type_of_build_object_id, #appartements
                  :rooms,
                  :area,
                  :living_area,
                  :floor,
                  :planning_id
  
  accepts_nested_attributes_for :photos, :address
  
  before_save :count_rating
  before_create :set_rating
  
  def count_rating
    self.user ||= User.first #если юзер не задан то добавить как от админа
    #todo rating
    r = 0
    r += 1 if user.rating.between?(3,4)
    r += 2 if user.rating == 5
    filled_attributes = attributes.select { |k,v| !!v }
    attr_count = attributes.count
    attributes.each do |attr_name, attr_value|
      
    end
    self.rating = r
  end
  
  #Объектам в зависимости от заполненности присваивается рейтинг от 0 до 2 баллов, 
  #за платные услуги свыше 2000 в месяц за объект присваивается 3 балла. 
  #За ввод объекта пользователем с рейтингом 3-4 рейтинг объекта повышается на 1 балл. 
  #За ввод объекта пользователем с рейтингом 5 рейтинг объекта повышается на 2 балла.
  def set_rating

  end
  
  def to_s
    name
  end
end
