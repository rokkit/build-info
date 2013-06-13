# encoding: UTF-8
ActiveAdmin.register City do
    menu parent: "Справочник", priority: 2
    
    form do |f|
      f.inputs do
        f.input :region, label:"Регион", :as => :autocomplete, :url => autocomplete_region_name_regions_path, 
                :input_html => { :id => "region_name", :name => "", :id_element => "#city_region_id" }
        f.input :region_id, :as => :hidden, :input_html => { :name => "city[region_id]" }
        f.input :name
      end
      f.actions  
    end
end
