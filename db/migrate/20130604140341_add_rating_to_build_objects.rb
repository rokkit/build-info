class AddRatingToBuildObjects < ActiveRecord::Migration
  def change
    add_column :build_objects, :rating, :integer
  end
end
