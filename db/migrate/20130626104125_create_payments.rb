class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.integer :payable_id
      t.string :payable_type
      t.references :user
      t.integer :reason_id
      t.text :comment
      t.boolean :status, deafult: false

      t.timestamps
    end
    add_index :payments, :user_id
  end
end
