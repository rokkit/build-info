class ChangeNameInAddress < ActiveRecord::Migration
  def change
    rename_column :addresses, :house_id, :build_object_id
  end
end
