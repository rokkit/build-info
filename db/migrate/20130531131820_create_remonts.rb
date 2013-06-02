class CreateRemonts < ActiveRecord::Migration
  def change
    create_table :remonts do |t|

      t.timestamps
    end
  end
end
