class CreateValutes < ActiveRecord::Migration
  def change
    create_table :valutes do |t|
      t.string :name

      t.timestamps
    end
  end
end
