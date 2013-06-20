class AddConfirmedAtToAgincies < ActiveRecord::Migration
  def change
    add_column :agincies, :confirmed_at, :date
  end
end
