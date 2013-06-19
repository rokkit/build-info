class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :var
      t.string :value

      t.timestamps
    end
  end
end
