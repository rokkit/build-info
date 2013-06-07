class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.datetime :date
      t.references :user
      t.references :build_object
      t.integer :status

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :build_object_id
  end
end
