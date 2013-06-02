class CreateOverlaps < ActiveRecord::Migration
  def change
    create_table :overlaps do |t|
      t.string :name

      t.timestamps
    end
  end
end
