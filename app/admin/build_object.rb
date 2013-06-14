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
          bool_column  :archived
          default_actions
        end
        show do |b|
            panel 'Параметры объекта' do
              attributes_table_for b do
                row :id
                row :type_of_build_object
                row :price do |product|
                      number_to_currency product.price, :unit => "руб."
                    end
                bool_row :ipoteka
                row :user
                bool_row :archived
              end
            end
            panel 'Параметры дома' do
              attributes_table_for b do
                row :type_of_house
                row :byear
                row :material
                bool_row :remont
                bool_row :elevator
                bool_row :chute
                bool_row :consierge
              end
            end
            panel 'Параметры квартиры', if: proc {false} do
              attributes_table_for b do
                row :rooms
                row :floor
                row :area
                row :living_area
                row :kitchen_area
              end
            end
            panel 'Адрес' do
              attributes_table_for b.address do
                      rows :country, :region, :city, :distinct, :street, :number_house
              end
            end
            active_admin_comments
        end
        form do |f|
          f.object.address = Address.new
          f.object.photos = [Photo.new]
          f.inputs "Тип объекта" do
            f.input :type_of_build_object   
            f.input :user     
            f.input :archived    
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
