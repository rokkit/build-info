require "nokogiri"
require "open-uri"

namespace :crawle do
  desc "parse"
  task :parse => :environment do
    url = "http://emls.ru/flats/?query=r1/1/r2/1/r3/1/reg/2/dept/2/dist/39/sort1/7/dir1/1/s/1/sort2/1/dir2/2/interval/3"
    page = Nokogiri::HTML(open(url))
    rows = page.css('div.content-emls table.html_table_1 tr.html_table_tr_1')  
    
    hrefs = rows.collect { |row|
      row['data-href'] if row['data-href'] =~ /^\/fullinfo\//  #получаем список ссылок на объекты
      }.compact
      build_objects = Array.new

    hrefs[1..15].each do |href|
      
      build_object = BuildObject.new   
      build_object[:photos] = Array.new 
      remote_url = "http://emls.ru#{href}"
      full_info_page = Nokogiri::HTML(open(remote_url))
      info_fields = full_info_page.css("div#emls_tab_data_1 table.description_table tr")
        description_table = full_info_page.css("table.description_table tr")
          build_object[:description] = full_info_page.css(".description_column_left p").inner_text #получаем примечание
          format_address(description_table[1].css("td")[1].inner_html).build_objects << build_object
          #build_object[:address].metro = description_table[2].css("td")[1].inner_text
          build_object[:rooms] = description_table[3].css("td")[1].inner_text
          build_object[:type_of_deal] = description_table[4].css("td")[1].inner_text #тип сделки
          build_object[:price] = description_table[5].css("td")[1].inner_text
          build_object[:owning] = description_table[6].css("td")[1].inner_text #собственность
          build_object[:planning] = description_table[7].css("td")[1].inner_text
          build_object[:area] = description_table[8].css("td")[1].inner_text
          build_object[:living_area] = description_table[9].css("td")[1].inner_text
          #площадь комнат 10
          build_object[:kitchen_area] = description_table[11].css("td")[1].inner_text
          #прихожая 12
          #коридор 13
          build_object[:building] = description_table[14].css("td")[1].inner_text #здание
          build_object[:floor] = description_table[15].css("td")[1].inner_text
          build_object[:phone] = description_table[16].css("td")[1].inner_text
          build_object[:toilet] = Toilet.find_or_create_by_name name: description_table[17].css("td")[1].inner_text
          #балкон 18
          #пол 19
          build_object[:remont] = Remont.find_or_create_by_name name: description_table[20].css("td")[1].inner_text
          #ванна 21
          build_object[:hot_water] = Hotwater.find_or_create_by_name name: description_table[22].css("td")[1].inner_text
          build_object[:chute] = description_table[23].css("td")[1].inner_text
          build_object[:entrance] = description_table[24].css("td")[1].inner_text
          build_object[:view_from_windows] = ViewFromWindows.find_or_create_by_name name: description_table[25].css("td")[1].inner_text
          photo = Photo.new
          photo.remote_image_url =  "http://emls.ru#{full_info_page.css("img#photo_big_img").first['src']}"
          photo.build_object = build_object
          photo.save!
          
          puts "."
          build_object.save!
    end
  end
  
  def format_address address
    a = Address.new
    recvisites = {}
    #получаем город
    address = strip_html address
    recvisites[:country_id] = Country.find_by_name "Россия"
    recvisites[:region_id] = Region.find_or_create_by_name name: "Санкт-Петербург", country: recvisites[:country_id].id
    recvisites[:city_id] = City.find_or_create_by_name name: address.split[0], region: recvisites[:region_id].id
    recvisites[:distinct_id] = Distinct.find_or_create_by_name name: address.split[2], city: recvisites[:city_id].id
    recvisites[:street_id]  = Street.find_or_create_by_name name: (address.match(/\n(.*),/)[0])[0..-2], distinct_id: recvisites[:distinct_id].id #ищем от перевода строки до запятой и убираем запятую
    recvisites[:number_house] = address.split[-1]
    a = Address.where(recvisites).first_or_create
    a
  end
  def strip_html(str)
    document = Nokogiri::HTML.parse(str)
    document.css("br").each { |node| node.replace("\n") }
    document.text
  end
end
