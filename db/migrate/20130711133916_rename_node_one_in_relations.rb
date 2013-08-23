class RenameNodeOneInRelations < ActiveRecord::Migration
  def change
    rename_column :relationships, :node_one_id, :node_id
  end
end
