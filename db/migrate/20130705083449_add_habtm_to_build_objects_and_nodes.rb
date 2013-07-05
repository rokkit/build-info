class AddHabtmToBuildObjectsAndNodes < ActiveRecord::Migration
  create_table :nodes_addresses, :id => false do |t|
    t.references :node, :address
  end

  add_index :nodes_addresses, [:node_id, :address_id]
end
