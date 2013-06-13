# encoding: UTF-8
ActiveAdmin.register Region do
      menu parent: "Справочник", priority: 1
    
      
      form do |f|
        f.inputs do
          f.input :country, :as => :autocomplete, :url => autocomplete_country_name_countries_path, 
                  :input_html => { :id => "country_name", :name => "", :id_element => "#region_country_id" }
          f.input :country_id, :as => :hidden, :input_html => { :name => "region[country_id]" }
          f.input :name
        end
        f.actions  
      end
end
