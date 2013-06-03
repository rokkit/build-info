class AddPriceToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :price, :decimal
  end
end
