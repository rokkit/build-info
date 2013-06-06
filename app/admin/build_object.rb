# encoding: UTF-8
ActiveAdmin.register BuildObject do
        menu parent: "Объекты"
        index do
          column "Тип объекта", :type_of_build_object
          column :price do |p|
            number_to_currency p.price
          end
          column "Тип дома", :type_of_house
          column "Добавил", :user
          default_actions
        end
        form do |f|
          f.object.address = Address.new
          f.object.photos = [Photo.new]
          f.inputs "Тип объекта" do
            f.input :type_of_build_object   
            f.input :user         
          end
          f.inputs "Описание дома" do 
            f.input :type_of_house
            f.input :byear,:start_year => Date.today.year-100, :end_year => Date.today.year,discard_day:true,discard_month:true
            f.input :material
            f.input :overlap
            f.input :stair
            f.input :basement
          end
          f.inputs "Описание квартиры" do
            f.input :rooms
            f.input :area
            f.input :living_area
          end
          f.inputs "Адрес", for: :address do |adress_form|
            adress_form.input :country
            adress_form.input :region
            adress_form.input :city
            adress_form.input :distinct
            adress_form.input :street
            adress_form.input :bus
          end
          f.inputs "Фото", for: :photos do |adress_form|
            adress_form.input :image
          end
          f.inputs "Описание сделки" do
            f.input :price
          end

              f.actions  
        end
end
