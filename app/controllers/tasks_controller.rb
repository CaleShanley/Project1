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
    @list = TodoList.find params[:list_id]
    @task = Task.new
  end

  def create
    if @current_user.present?
      task = Task.create list_params
      @current_user.todo_lists.find(params["task"]["list_id"]).tasks << task 
    redirect_to todo_lists_path
  end

  private

  def list_params
    params.require(:task).permit(:name)
  end
end
