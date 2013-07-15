class RenameTaskToTasks < ActiveRecord::Migration
  def change
    rename_table :rake_task, :rake_tasks
  end
end
