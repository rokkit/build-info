class CreateTableBuildObjectsNodes < ActiveRecord::Migration
  def change
    create_table :build_objects_nodes, id: false do |t|
      t.references :build_object, :node, null: false
    end
  end
end
