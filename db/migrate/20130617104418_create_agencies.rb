class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.references :owner
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :agencies, :owner_id
  end
end
