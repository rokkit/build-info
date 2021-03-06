class BuildObject < ActiveRecord::Base
  
  is_impressionable
  
  acts_as_votable
  
  belongs_to :type_of_build_object
  belongs_to :user
  has_many :photos, :dependent => :destroy 
  has_and_belongs_to_many :nodes
  
  #house
  belongs_to :type_of_house
  belongs_to :material
  belongs_to :overlap
  belongs_to :stair
  belongs_to :basement
  belongs_to :address
  belongs_to :toilet
  #end house
  
  #appartement
  belongs_to :planning
  belongs_to :remont
  belongs_to :hotwater
  belongs_to :valute
  belongs_to :view_from_windows
  #end appartement
  
  attr_accessible :bank,
                  :builder,
                  :busstop, 
                  :byear, 
                  :chute, 
                  :clinic, 
                  :consierge, 
                  :domesticserv, 
                  :elevator, 
                  :hfirstfloor, 
                  :kgarten, 
                  :name, 
                  :overhault, 
                  :park, 
                  :parking, 
                  :phrmacy, 
                  :school, 
                  :shopping, 
                  :shopprod, 
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
                  :kitchen_area,
                  :archived,
                  :appartement_number, :photos_attributes,
                  :selled_at
  
  accepts_nested_attributes_for :photos, :address, allow_destroy: true
  
  validates :type_of_build_object, :price, :photos, presence: true
  
  before_save :count_rating
  after_create :windraw_cost_from_account
  
  scope :actual, -> { where(archived: false, selled_at: nil) }
  scope :full, -> { includes([:address, :photos]) }
  scope :invest_projects, -> { where(private: true) }
  scope :public_objects, -> { where(private: false) }
  
  #FILTER SCOPES
  scope :filter_country, lambda {|country| where(addresses: { country_id: country })}
  scope :filter_region, lambda {|region| where(addresses: { region_id: region })}
  scope :filter_city, lambda {|city| where(addresses: { city_id: city })}
  scope :filter_distinct, lambda {|distinct| where(addresses: { distinct_id: distinct })}
  scope :filter_street, lambda {|street| where(addresses: { street_id: street })}
  
  scope :filter_boolean, -> (field, value) { where field => value }
  scope :filter_number, -> (field, operation, value) do
    if operation == :gt
      where("#{field} >= ?", value)
    elsif operation == :lt
      where("#{field} < ?", value)
    elsif operation == :eq
      where("#{field} = ?", value)
    end
  end
  
  #END FILTERS
  
  def count_rating
    # self.user ||= User.first #если юзер не задан то добавить как от админа
    #todo rating
    # r = 0
    # r += 1 if user.rating.between?(3,4)
    # r += 2 if user.rating == 5
    filled_attributes = attributes.select { |k,v| !!v }
    percent_filled_attributes = (attributes.count / filled_attributes.count).round * 100 #считаем процент заполненных
    if percent_filled_attributes == 100
      self.user.add_rating! :full_described_object
      unless self.user.agency.nil? #увеличить рейтинг агества 
        self.user.agency.increment(:rating).save
      end
    end
    # r += 1 if percent_filled_attributes < 60
    # r += 1 if percent_filled_attributes < 80
    
    self.rating = percent_filled_attributes
  end
  
  #Объектам в зависимости от заполненности присваивается рейтинг от 0 до 2 баллов, 
  #за платные услуги свыше 2000 в месяц за объект присваивается 3 балла. 
  #За ввод объекта пользователем с рейтингом 3-4 рейтинг объекта повышается на 1 балл. 
  #За ввод объекта пользователем с рейтингом 5 рейтинг объекта повышается на 2 балла.
  
  #not removing just archiving
  def archive!
    self.archived = true
    save!
  end
  
  def to_s
    "Объект"
  end
  
  #ПОдборка объектов для встречной продажи
  def self.match node
    filter_number(:price, :gt, node.min_price).filter_number(:price, :lt, node.max_price)
  end
  def name
    "#{type_of_build_object}, #{address}"
  end
private
  def windraw_cost_from_account
    self.user.account.total -= Variables.find_by_key("create_build_object_price").value.to_f
    self.user.account.save!
  end
end
