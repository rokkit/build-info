class ChangeTypeAddressInBuildObjects < ActiveRecord::Migration
  def change
    change_column :build_objects, :floor, :string
  end
end
