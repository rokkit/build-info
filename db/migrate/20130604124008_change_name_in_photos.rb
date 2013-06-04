class ChangeNameInPhotos < ActiveRecord::Migration
  def change
    rename_column :photos, :house_id, :build_object_id
  end
end
