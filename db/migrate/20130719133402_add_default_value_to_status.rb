class AddDefaultValueToStatus < ActiveRecord::Migration
  def change
    change_column :nodes, :status, :integer, default: 0, null: false
  end
end
