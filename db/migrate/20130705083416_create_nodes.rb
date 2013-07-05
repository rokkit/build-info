class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.references :sell, null: false
      t.references :buy
      t.decimal :max_price
      t.decimal :min_price
      t.float :max_area
      t.float :min_area
      t.float :max_living_area
      t.float :min_living_area
      t.float :max_kitchen_area
      t.float :min_kitchen_area
      t.integer :min_rooms
      t.integer :max_rooms
      t.integer :status, deafult: 0
      t.text :comment

      t.timestamps
    end
    add_index :nodes, :sell_id
    add_index :nodes, :buy_id
  end
end
