# encoding: UTF-8
ActiveAdmin.register Street do
      menu parent: "Справочник", priority: 4
      form do |f|
        f.inputs do
          f.input :distinct,label: "Район", :as => :autocomplete, :url => autocomplete_distinct_name_distincts_path, 
                  :input_html => { :id => "city_name", :name => "", :id_element => "#street_distinct_id" }
          f.input :distinct_id, :as => :hidden, :input_html => { :name => "street[distinct_id]" }
          f.input :name
        end
        f.actions  
      end
end
