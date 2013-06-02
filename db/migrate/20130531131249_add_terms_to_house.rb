class AddTermsToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :terms_id, :integer
  end
end
