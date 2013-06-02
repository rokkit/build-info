class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.decimal :price
      t.references :valute
      t.boolean :ipoteka
      t.text :desciption

      t.timestamps
    end
    add_index :terms, :valute_id
  end
end
