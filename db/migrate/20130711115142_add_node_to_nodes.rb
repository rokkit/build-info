class AddNodeToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :node_id, :integer
  end
end
