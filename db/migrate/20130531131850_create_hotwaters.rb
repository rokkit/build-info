class CreateHotwaters < ActiveRecord::Migration
  def change
    create_table :hotwaters do |t|

      t.timestamps
    end
  end
end
