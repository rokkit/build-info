class AddHumanNameToVariables < ActiveRecord::Migration
  def change
    add_column :variables, :human_name, :string
  end
end
