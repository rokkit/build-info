class AddDescriptionToBuildObjects < ActiveRecord::Migration
  def change
    add_column :build_objects, :description, :text
  end
end
