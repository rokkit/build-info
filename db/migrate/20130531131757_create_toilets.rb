class CreateToilets < ActiveRecord::Migration
  def change
    create_table :toilets do |t|
      t.string :name

      t.timestamps
    end
  end
end
