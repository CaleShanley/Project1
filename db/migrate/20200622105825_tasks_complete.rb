class TasksComplete < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :complete, :boolean, :default => false
  end
end
