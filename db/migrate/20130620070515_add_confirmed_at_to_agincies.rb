class AddConfirmedAtToAgincies < ActiveRecord::Migration
  def change
    add_column :agencies, :confirmed_at, :date
  end
end
