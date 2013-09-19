class AddElmsNumberToBuildObjects < ActiveRecord::Migration
  def change
    add_column :build_objects, :elms_number, :string
  end
end
