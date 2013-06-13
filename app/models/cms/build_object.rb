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
                  :planning,
                  :planning_id,
                  :type_of_build_object,
                  :type_of_house, 
                  :material,
                  :overlap, 
                  :stair, 
                  :basement, 
                  :user,
                  :description,
                  :kitchen_area
  
  accepts_nested_attributes_for :photos, :address
  
  validates :type_of_build_object,:type_of_house, :price, presence: true
  
  before_save :count_rating
  before_create :set_rating
  
  scope :actual, -> { where(archived: false) }
  scope :full, -> { joins(:address) }
  #FILTER SCOPES
  scope :filter_country, lambda {|country| full.where(addresses: { country_id: country })}
  scope :filter_region, lambda {|region| full.where(addresses: { region_id: region })}
  scope :filter_city, lambda {|city| full.where(addresses: { city_id: city })}
  scope :filter_distinct, lambda {|distinct| full.where(addresses: { distinct_id: distinct })}
  scope :filter_street, lambda {|street| full.where(addresses: { street_id: street })}
  
  
  #END FILTERS
  
  def count_rating
    self.user ||= User.first #если юзер не задан то добавить как от админа
    #todo rating
    r = 0
    r += 1 if user.rating.between?(3,4)
    r += 2 if user.rating == 5
    filled_attributes = attributes.select { |k,v| !!v }
    percent_filled_attributes = (attributes.count / filled_attributes.count).abs * 100 #считаем процент заполненных
    r += 1 if percent_filled_attributes < 60
    r += 1 if percent_filled_attributes < 80
    self.rating = r
  end
  
  #Объектам в зависимости от заполненности присваивается рейтинг от 0 до 2 баллов, 
  #за платные услуги свыше 2000 в месяц за объект присваивается 3 балла. 
  #За ввод объекта пользователем с рейтингом 3-4 рейтинг объекта повышается на 1 балл. 
  #За ввод объекта пользователем с рейтингом 5 рейтинг объекта повышается на 2 балла.
  def set_rating

  end
  
  #not removing just archiving
  def archive!
    self.archived = true
  end
  
  def to_s
    name
  end
end
