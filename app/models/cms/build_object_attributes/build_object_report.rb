class BuildObjectReport
  include Datagrid
  
  scope do
    House
  end
  
  column(:id)
end