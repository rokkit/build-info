class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :node_one_id
      t.integer :node_two_id

      t.timestamps
    end
  end
end
