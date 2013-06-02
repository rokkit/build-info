class AddAddressIdToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :address_id, :integer
  end
end
