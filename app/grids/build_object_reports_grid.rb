# encoding: UTF-8
class BuildObjectReportsGrid

  include Datagrid

  scope do
    BuildObject.actual.joins(:address)
  end

  filter(:price, :integer, :range => true,header: "Цена")
  filter(:ipoteka, :boolean, header: "Ипотека")
  filter(:created_at, :date, :range => true, header: "Добавлено")
  filter(:type_of_build_object_id, :enum, :select => TypeOfBuildObject.all.map {|r| [r, r.id]},
          header: "Тип объекта")
          
  filter(:country, :enum, :select => Country.all.map {|r| [r, r.id]},
          header: "Страна", :allow_blank => true) do |value|
            self.where(addresses:{country_id: value.to_i})
          end
  filter(:region, :enum, :select => Region.all.map {|r| [r, r.id]},
          header: "Регион", allow_blank: true) do |value|
            self.where(addresses:{region_id: value.to_i})
          end
  filter(:city, :enum, :select => City.all.map {|r| [r, r.id]},
          header: "Город", allow_blank: true) do |value|
            self.where(addresses:{city_id: value.to_i})
          end
  filter(:distinct, :enum, :select => Distinct.all.map {|r| [r, r.id]},
          header: "Район", allow_blank: true) do |value|
            self.where(addresses:{distinct_id: value.to_i})
          end
  filter(:street, :enum, :select => Street.all.map {|r| [r, r.id]},
          header: "Район", allow_blank: true) do |value|
            self.where(addresses:{street_id: value.to_i})
          end
  filter(:area, :integer, range: true, header: "Общая пл.")
          
  column(:price)
  column(:address)
  column(:area, html: true) do |model|
    render partial: "build_objects/area", locals: {model: model}
  end
  column(:description, html: true) do |model|
    render partial: "build_objects/build_object", locals: {model: model}
  end
end
