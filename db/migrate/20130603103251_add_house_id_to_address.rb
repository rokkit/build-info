class AddHouseIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :house_id, :integer
  end
end
