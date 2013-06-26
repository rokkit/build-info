class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :accountable_id
      t.string :accountable_type
      t.decimal :total
      t.references :valute

      t.timestamps
    end
    add_index :accounts, :valute_id
  end
end
