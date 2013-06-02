class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.references :user
      t.text :content

      t.timestamps
    end
    add_index :news, :user_id
  end
end
