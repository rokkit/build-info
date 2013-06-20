class CreateReesterObjects < ActiveRecord::Migration
  def change
    create_table :reester_objects do |t|
      t.string :reester_id
      t.string :cadaster_number
      t.string :address
      t.string :apartement_number
      t.float :area
      t.decimal :cost
      t.decimal :cost_one_meter
      t.references :distinct

      t.timestamps
    end
    add_index :reester_objects, :distinct_id
  end
end
