class CreateTypeOfLinkedAccounts < ActiveRecord::Migration
  def change
    create_table :type_of_linked_accounts do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
