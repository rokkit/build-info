class AddRatingToAgency < ActiveRecord::Migration
  def change
    add_column :agencies, :rating, :integer
  end
end
