class AddNodeToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :node, :reference
  end
end
