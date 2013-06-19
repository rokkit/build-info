class AddPrivateToBuildObjects < ActiveRecord::Migration
  def change
    add_column :build_objects, :private, :boolean
  end
end
