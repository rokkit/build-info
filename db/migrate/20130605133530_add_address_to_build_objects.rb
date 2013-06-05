class AddAddressToBuildObjects < ActiveRecord::Migration
  def change
    add_column :build_objects, :address_id, :integer
  end
end
