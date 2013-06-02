class CreateAppartements < ActiveRecord::Migration
  def change
    create_table :appartements do |t|
      t.integer :floor
      t.integer :rooms
      t.float :area
      t.float :living_area
      t.float :kitchen_area
      t.references :planning
      t.float :hfloor
      t.references :toilet
      t.references :remont
      t.boolean :balkon
      t.references :hotwater
      t.references :view_from_windows
      t.references :house
      t.references :terms

      t.timestamps
    end
    add_index :appartements, :planning_id
    add_index :appartements, :toilet_id
    add_index :appartements, :remont_id
    add_index :appartements, :hotwater_id
    add_index :appartements, :view_from_windows_id
    add_index :appartements, :house_id
    add_index :appartements, :terms_id
  end
end
