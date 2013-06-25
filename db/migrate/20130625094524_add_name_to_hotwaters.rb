class AddNameToHotwaters < ActiveRecord::Migration
  def change
    add_column :hotwaters, :name, :string
  end
end
