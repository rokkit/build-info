class ChangeAddresses < ActiveRecord::Migration
  def change
    change_column :addresses, :country_id, :integer, null: false, default: 0
  end
end
