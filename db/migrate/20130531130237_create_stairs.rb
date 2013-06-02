class CreateStairs < ActiveRecord::Migration
  def change
    create_table :stairs do |t|
      t.string :name

      t.timestamps
    end
  end
end
