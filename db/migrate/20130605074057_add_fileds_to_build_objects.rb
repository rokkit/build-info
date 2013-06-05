class AddFiledsToBuildObjects < ActiveRecord::Migration
  def change
    add_column :build_objects, :ipoteka, :boolean
    add_column :build_objects, :valute_id, :integer
  end
end
