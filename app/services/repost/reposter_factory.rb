#encoding utf-8
require "nokogiri"
require "open-uri"
class ReposterFactory
  #include Repost
  def self.get_instansed provider, build_object, login, password
    case provider
      when "Avito"
        return AvitoReposter.new build_object, login, password
    end
  end
end

  class Reposter
     def initialize(build_object, login, password)
       @login = login
       @password = password
       @agent = Mechanize.new
       @build_object = build_object
     end
  end
  class AvitoReposter < Reposter

     def initialize build_object, login, password
       super
     end
     def repost!
        page = open_page_and_login
        page = add_first_stage
     end

  private
   def open_page_and_login
     url = "https://www.avito.ru/profile"  #get login page
     page = @agent.get(url)
     login_form = page.forms.first
     login_form.login = @login
     login_form.password = @password
     page = @agent.submit login_form
     raise Exception.new "Доступ запрещён" unless page.uri.to_s == "https://www.avito.ru/profile"
     page
   end
   def add_first_stage
      #page.link_with(text: "Подать объявление").click
      page = @agent.get("http://www.avito.ru/additem")
      build_object_form = page.forms.first
      build_object_form.category_id = "24" #категория Недвижимость => Квартиры на авито
      build_object_form.description = @build_object.description
      build_object_form.price = @build_object.price
      build_object_form['params[201]'] = '1059' #тип объявления - продам
      build_object_form['params[549]'] = '5695' #кол-во комнат - студия
      build_object_form['params[496]'] = '5120' #первый этаж
      build_object_form['params[497]'] = '5182' #этажей в доме
      build_object_form['params[498]'] = '5244' #тип дома - кирпичный
      build_object_form['params[499]'] = '5254' #вид объекта - вторичка

      build_object_form['params[578]'] = @build_object.area
      build_object_form['params[494]'] = @build_object.address
      build_object_form['service_code'] = 'free'

      build_object_form.file_uploads.first.file_name = @build_object.photos.first.image_url(:main).to_s
      page  = @agent.submit build_object_form
      page.body.force_encoding("utf-8")


      #get captcha
      filename = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join
      @agent.get(page.search("#captcha_image").first.attributes["src"]).save "public/images/captcha/#{filename}.jpg"
      [captcha: "/images/captcha/#{filename}.jpg"] 
   end
  end

