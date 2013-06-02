class CreateViewFromWindows < ActiveRecord::Migration
  def change
    create_table :view_from_windows do |t|
      t.string :name

      t.timestamps
    end
  end
end
