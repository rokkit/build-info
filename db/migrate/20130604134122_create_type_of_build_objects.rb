class CreateTypeOfBuildObjects < ActiveRecord::Migration
  def change
    create_table :type_of_build_objects do |t|
      t.string :name

      t.timestamps
    end
  end
end
