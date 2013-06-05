ActiveAdmin.register BuildObject do
        menu parent: "Объекты"
        index do
          column "Тип объекта", :type_of_build_object
          column :price do |p|
            number_to_currency p.price
          end
          column "Тип дома", :type_of_house
          column "Добавил", :user
        end
        form do |f|
          f.object.address = Address.new
          f.object.photos = [Photo.new]
          f.inputs do
            f.input :type_of_build_object
            f.input :price
            f.input :type_of_house
            f.input :material
            f.input :overlap
            f.input :stair
            f.input :basement
            f.input :user
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

              f.actions  
        end
end
