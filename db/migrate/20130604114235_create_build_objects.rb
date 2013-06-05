class CreateBuildObjects < ActiveRecord::Migration
  def change
    create_table :build_objects do |t|
      t.string :type
      t.decimal  :price
      t.integer  :user_id
      t.integer :type_of_build_object_id
      #HOUSE
      t.integer  :type_of_house_id
      t.date     :byear
      t.boolean  :overhault
      t.integer  :material_id
      t.integer  :overlap_id
      t.boolean  :elevator
      t.boolean  :chute
      t.boolean  :consierge
      t.integer  :stair_id
      t.integer  :basement_id
      t.float    :hfirstfloor
      t.string   :name
      t.string   :builder
      t.string   :shopprod
      t.string   :domesticserv
      t.string   :shopping
      t.string   :phrmacy
      t.string   :clinic
      t.string   :kgarten
      t.string   :school
      t.string   :bank
      t.string   :parking
      t.string   :park
      t.string   :busstop
      #t.integer  :address_id
      t.integer  :terms_id
      #END HOUSE
      
      #APPARTEMENT
      t.integer  "floor"
      t.integer  "rooms"
      t.float    "area"
      t.float    "living_area"
      t.float    "kitchen_area"
      t.integer  "planning_id"
      t.float    "hfloor"
      t.integer  "toilet_id"
      t.integer  "remont_id"
      t.boolean  "balkon"
      t.integer  "hotwater_id"
      t.integer  "view_from_windows_id"
      #END APPARTEMENT
      t.timestamps
    end
  end
end
