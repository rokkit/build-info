class AddAppartementNumberToBuildobjects < ActiveRecord::Migration
  def change
    add_column :build_objects, :appartement_number, :integer
    change_column :build_objects, :private, :boolean, default: false
  end
end
