class TodoListsController < ApplicationController
  def index
    @lists = @current_user.todo_lists
  end

  def show
    @list = TodoList.find params[:id]
  end

  def new
    @list = TodoList.new
  end

  def create
    if @current_user.present?
      list = TodoList.create list_params
      @current_user.todo_lists << list
    end
    redirect_to todo_lists_path	
  end

  def complete
    task = TodoList.find params[:id]
    task.destroy
    redirect_to todo_lists_path
  end


  
  private
  def list_params
    params.require(:todo_list).permit(:title, :description)
  end

end
