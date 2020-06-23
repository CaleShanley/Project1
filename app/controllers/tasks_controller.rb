class TasksController < ApplicationController
  def complete
    task = Task.find params[:id]
    task.update_attribute(:complete, true)
  end
end
