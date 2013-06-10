class AddArchivedToBuildObjects < ActiveRecord::Migration
  def change
    add_column :build_objects, :archived, :boolean,:default => false
  end
end
