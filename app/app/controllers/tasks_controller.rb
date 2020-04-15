class TasksController < ApplicationController
  before_action :authenticate_user

  def index
    @tasks = Task.where(user_id: get_current_user.id)
  end

  def create
    task = Task.create task_params
    task.user_id = get_current_user.id
    if task.save 
      redirect_to tasks_url
    else
      flash[:alert] = task.errors.messages
      redirect_to new_task_url
    end
  end

  def new
    @task = Task.new
  end

  def edit
    pp params
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    pp task
    redirect_to tasks_path if task.nil?
    if task.update_attributes(task_params)
      if task.save
        redirect_to tasks_url
      end
    end
    #redirect_to edit_task_url
    
  end
  
  def delete
    task = Task.find(:id)
    if task && get_current_user.id == task.user_id 
      task.destroy
    end
  end

  private
    def task_params
      params.require(:task).permit(:user_id, :summary, :status, :body)
    end

end
