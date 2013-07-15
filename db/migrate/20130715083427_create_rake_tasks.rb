class CreateRakeTasks < ActiveRecord::Migration
  def change
    create_table :rake_task do |t|
      t.string :name
      t.string :task
      t.text :shedule
      t.boolean :status

      t.timestamps
    end
  end
end
