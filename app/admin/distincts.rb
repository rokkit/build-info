# encoding: UTF-8
ActiveAdmin.register Distinct do
      menu parent: "Справочник", priority: 3
      form do |f|
        f.inputs do
          f.input :city, label:"Город",:as => :autocomplete, :url => autocomplete_city_name_cities_path, 
                  :input_html => { :id => "city_name", :name => "", :id_element => "#distinct_city_id" }
          f.input :city_id, :as => :hidden, :input_html => { :name => "distinct[city_id]" }
          f.input :name
        end
        f.actions  
      end
end
