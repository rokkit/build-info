class BuildObjectReportsGrid

  include Datagrid

  scope do
    BuildObject
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)

  column(:id)
  column(:price)
  column(:rating)
  column(:user)
  column(:created_at) do |model|
    model.created_at.to_date
  end
end
