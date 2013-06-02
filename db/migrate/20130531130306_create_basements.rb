class CreateBasements < ActiveRecord::Migration
  def change
    create_table :basements do |t|
      t.string :name

      t.timestamps
    end
  end
end
