class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :country
      t.references :region
      t.references :city
      t.references :distinct
      t.references :street
      t.string :number_house
      t.string :number_korp
      t.string :minibus
      t.string :bus
      t.string :trolleybus
      t.string :railsbus
      t.references :metro

      t.timestamps
    end
    add_index :addresses, :country_id
    add_index :addresses, :region_id
    add_index :addresses, :city_id
    add_index :addresses, :distinct_id
    add_index :addresses, :street_id
  end
end
