class CreateLinkedAccounts < ActiveRecord::Migration
  def change
    create_table :linked_accounts do |t|
      t.references :type_of_linked_account, null: false
      t.references :user, null: false
      t.string :login
      t.string :password

      t.timestamps
    end
    add_index :linked_accounts, :type_of_linked_account_id
    add_index :linked_accounts, :user_id
  end
end
