class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.references :type_of_house
      t.date :byear
      t.boolean :overhault
      t.references :material
      t.references :overlap
      t.boolean :elevator
      t.boolean :chute
      t.boolean :consierge
      t.references :stair
      t.references :basement
      t.float :hfirstfloor
      t.string :name
      t.string :builder
      t.references :user
      t.string :shopprod
      t.string :domesticserv
      t.string :shopping
      t.string :phrmacy
      t.string :clinic
      t.string :kgarten
      t.string :school
      t.string :bank
      t.string :parking
      t.string :park
      t.string :busstop

      t.timestamps
    end
    add_index :houses, :type_of_house_id
    add_index :houses, :material_id
    add_index :houses, :overlap_id
    add_index :houses, :stair_id
    add_index :houses, :basement_id
    add_index :houses, :user_id
  end
end
