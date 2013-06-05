class BuildObjectReportsGrid

  include Datagrid

  scope do
    BuildObject
  end

  filter(:price, :integer, :range => true)
  filter(:created_at, :date, :range => true)
  filter(:build_object_type, :enum, :select => TypeOfBuildObject.all.map {|r| [r.humanize, r]})
  
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
