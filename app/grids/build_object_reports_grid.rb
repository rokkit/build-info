class BuildObjectReportsGrid

  include Datagrid

  scope do
    BuildObject.joins(:address)
  end

  filter(:price, :integer, :range => true,header: "Цена")
  filter(:ipoteka, :boolean, header: "Ипотека")
  filter(:created_at, :date, :range => true, header: "Добавлено")
  filter(:type_of_build_object_id, :enum, :select => TypeOfBuildObject.all.map {|r| [r, r.id]},
          header: "Тип объекта")
          
  filter(:country, :enum, :select => Country.all.map {|r| [r, r.id]},
          header: "Страна") do |value|
            self.where(addresses:{country_id: value.to_i})
          end
          
  column(:id)
  column(:price)
  column(:address)
  column(:rating, order: :rating)
  column(:user)
  column(:photos, html: true) do |model|
    render partial: "build_objects/build_object", locals: {model: model}
  end
  column(:created_at) do |model|
    model.created_at.to_date
  end
end
