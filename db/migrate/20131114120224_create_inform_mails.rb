class CreateInformMails < ActiveRecord::Migration
  def change
    create_table :inform_mails do |t|
      t.text :body
      t.text :sms_body
      t.references :user

      t.timestamps
    end
    add_index :inform_mails, :user_id
  end
end
