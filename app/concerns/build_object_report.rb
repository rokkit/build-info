require "open-uri"
class BuildObjectReport < Prawn::Document
  def initialize(build_object, view)
      super(top_margin: 70)
      @build_object = build_object
      @view = view
      
      font_families.update(
           "Verdana" => {
             :bold => "#{Rails.root}/public/fonts/verdanab.ttf",
             :italic => "#{Rails.root}/public/fonts/verdanai.ttf",
             :normal  => "#{Rails.root}/public/fonts/verdana.ttf" })
      font "Verdana", :size => 10
      header
      make_main_table
      footer
    end
  def to_pdf
        render
  end
private
  def make_main_table
    table [
      [address_fields, address_fields]
    ]
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
  def footer
    # добавим время создания внизу страницы
        creation_date = Time.zone.now.strftime("Отчет сгенерирован %e %b %Y в %H:%M")
        go_to_page(page_count)
        move_down(600)
        text creation_date, :align => :right, :style => :italic, :size => 9
  end
end