class CreateDistincts < ActiveRecord::Migration
  def change
    create_table :distincts do |t|
      t.string :name
      t.references :city

      t.timestamps
    end
    add_index :distincts, :city_id
  end
end
