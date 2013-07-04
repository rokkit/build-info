class AddSelledToBuildObjects < ActiveRecord::Migration
  def change
    add_column :build_objects, :selled_at, :datetime
  end
end
