class AddNameToRemonts < ActiveRecord::Migration
  def change
    add_column :remonts, :name, :string
  end
end
