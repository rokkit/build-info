class AddFieldsToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :address, :text
    add_column :agencies, :phone, :string
    add_column :agencies, :fax, :string
    add_column :agencies, :site, :string
    add_column :agencies, :logo, :string
  end
end
