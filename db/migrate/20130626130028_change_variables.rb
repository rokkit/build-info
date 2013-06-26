class ChangeVariables < ActiveRecord::Migration
  def change
    remove_column :variables, :price_premium_account
    add_column :variables, :key, :string
    add_column :variables, :value, :string
  end
end