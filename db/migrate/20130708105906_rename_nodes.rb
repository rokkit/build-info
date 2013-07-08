class RenameNodes < ActiveRecord::Migration
  def change
    rename_table :nodes_addresses, :addresses_nodes
  end
end
