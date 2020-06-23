class TasksController < ApplicationController
  def complete
    task = Task.find params[:id]
    task.update_attribute(:complete, true)
  end

  def index
    @tasks = @current_user.todo_lists.tasks
  end

  def show
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
  end

  def create
    if @current_user.present?
      task = Task.create list_params
      # form now has listId
      @current_user.todo_lists.first.tasks << task # dont need to save to use
      # relation should be user -> list -> task
    end
    redirect_to todo_lists_path
  end

  private

  def list_params
    params.require(:task).permit(:name)
  end
end
