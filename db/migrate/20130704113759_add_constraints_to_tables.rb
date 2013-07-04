class AddConstraintsToTables < ActiveRecord::Migration
  def change
    change_column :accounts, :total, :decimal, default: 0, null: false
    change_column :agencies, :name, :string, null: false
    change_column :agencies, :rating, :integer, default: 0, null: false
    change_column :articles, :rating, :integer, default: 0, null: false
    change_column :articles, :published, :boolean, default: false
    change_column :build_objects, :price, :decimal, null: false
    change_column :build_objects, :user_id, :integer, null: false
    change_column :build_objects, :ipoteka, :boolean, default: false
  end
end
