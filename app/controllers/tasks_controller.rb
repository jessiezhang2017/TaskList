require 'date'

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:id)
  end

  def show

    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
     render :notfound, status: :not_found
    end
  end

  def create
    @task = Task.new(task_params) #instantiate a new task

    if @task.save # save returns true if the database insert succeeds
      redirect_to root_path # go to the index so we can see the book in the list
    else # save failed :(
      render :new # show the new book form view again
    end
  end

  def new
    @task = Task.new
  end

  def edit

    @task = Task.find_by(id: params[:id].to_i)
  end

  def update
    @task = Task.find_by(id: params[:id].to_i)
    @task.update(task_params)

    redirect_to task_path(task.id)
  end

  def destroy
    @task = Task.find_by(id: params[:id].to_i)
    @task.destroy

    redirect_to root_path
  end

  def mark_complete

    @task = Task.find_by(id: params[:id].to_i)
    if @task.completion_date == nil
      new_date = "#{Date.today}"
    else
      new_date = nil
    end

    @task.update(completion_date: new_date)
    redirect_to root_path
  end


  private
    def task_params
      return params.require(:task).permit(:name, :description, :completion_date)
    end

end
