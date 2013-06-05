class BuildObjectReportsGrid

  include Datagrid

  scope do
    BuildObject
  end

  filter(:price, :integer, :range => true)
  filter(:created_at, :date, :range => true)
  filter(:type_of_build_object_id, :enum, :select => TypeOfBuildObject.all.map {|r| [r, r.id]})
  
  column(:id)
  column(:price)
  column(:rating)
  column(:user)
  column(:photos, html: true) do |model|
    render partial: "build_objects/build_object", locals: {model: model}
  end
  column(:created_at) do |model|
    model.created_at.to_date
  end
end
