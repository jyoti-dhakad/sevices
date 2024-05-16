class TasksController < ApplicationController
    before_action :set_task, only: [:show, :update, :destroy]

    skip_before_action:verify_authenticity_token

  def index
    @tasks = Task.all
    render json: @tasks
  end

  def show
    debugger
    render json: @task
  end

  def create
    debugger
    @task = TaskService.create(task_params)
    if @task.valid?
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if TaskService.update(@task, task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    TaskService.destroy(@task)
    render json: {message:"destroyed successfully"}
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
