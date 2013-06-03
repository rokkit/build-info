class AddHouseIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :house_id, :integer
  end
end
