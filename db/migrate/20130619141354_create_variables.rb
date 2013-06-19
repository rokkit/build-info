class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.decimal :price_premium_account

      t.timestamps
    end
  end
end
