require "open-uri"
class BuildObjectReport < Prawn::Document
  def initialize(build_object, view)
      super(top_margin: 40)
      @build_object = build_object
      @view = view
      
      font_families.update(
           "Verdana" => {
             :bold => "#{Rails.root}/public/fonts/verdanab.ttf",
             :italic => "#{Rails.root}/public/fonts/verdanai.ttf",
             :normal  => "#{Rails.root}/public/fonts/verdana.ttf" })
      font "Verdana", :size => 10
      header
      main_text
      move_down 10
      make_main_table
      _footer
    end
  def to_pdf
        render
  end
private
  def main_text
    text "Номер объекта: #{@build_object.id}"
    text "#{address_fields}"
    text "Занесён: #{@build_object.created_at.strftime("%d.%m.%y")}, Последнее изменение: #{@build_object.updated_at.strftime("%d.%m.%y")}"
  end
  def make_main_table
    image open(@build_object.photos.first.image.path.to_s),:width => 250,:at => [300,600]
    table [
      ["Агент","#{@build_object.user}, #{@build_object.user.phone}"],
      ["Метро:", "#{@build_object.address.metro}"],
      ["Кол. комнат:", @build_object.rooms],
      ["Тип сделки:", "Прямая продажа"],
      ["Цена:", @build_object.price],
      ["Собственность:", ""],
      ["Планировка:", @build_object.planning],
      ["Площади:", "Общая: #{@build_object.area}, жилая #{@build_object.living_area}, кухня: #{@build_object.kitchen_area}"],
      ["Здание:", @build_object.type_of_house],
      ["Этаж:", @build_object.floor],
      ["Санузел:", @build_object.toilet],
      ["Балкон:", ""],
      ["Пол:", ""],
      ["Ремонт:", @build_object.remont],
      ["Ванна:", ""],
      ["Гор. вода:", @build_object.hotwater],
      ["Мусоропровод:", @build_object.chute],
      ["Вход:", ""],
      ["Вид из окон:", @build_object.view_from_windows]
    ]
    move_down 20
    text @build_object.description
  end
  def map_field
    image open("http://maps.google.com/maps/api/staticmap?size=382x256&sensor=false&zoom=16&markers=#{@build_object.address.lat}%2C#{@build_object.address.lng}")
  end
  def address_fields
    text "Адрес: #{@build_object.address.city}, #{@build_object.address.street}, дом #{@build_object.address.number_house}"
  end
  
  def header
    text "Home.info"
    stroke_horizontal_rule
      move_down(20)
  end
  def _footer
    # добавим время создания внизу страницы
        creation_date = Time.zone.now.strftime("Отчет сгенерирован %e %b %Y в %H:%M")
        bounding_box([bounds.left, bounds.bottom + 25], :width => 200) do
         text "© 2013 Home Info"
        end
        bounding_box([bounds.right-200, bounds.bottom + 25], :width => 200) do
         text creation_date, :align => :right, :style => :italic
        end
  end
end
