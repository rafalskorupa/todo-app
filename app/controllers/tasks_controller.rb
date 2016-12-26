class TasksController < ApplicationController
  def index
    @tasks_achieved = Task.where(active: true)
    @tasks_not_achieved = Task.where(active: false)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(creating_params)

    respond_to do |f|
      f.html { redirect_to tasks_url }
      f.js
    end
  end

  def update
    @task = Task.find(params[:id])

    @task.active = true
    @task.save

    respond_to do |f|
      f.html { redirect_to tasks_url }
      f.js
    end
  end

  def destroy
    @task = Task.destroy(params[:id])

    respond_to do |f|
      f.html { redirect_to tasks_url }
      f.js
    end
  end



  private

  def creating_params
    params.require(:task).permit(:name)
  end

  def updating_params
    params.require(:task).permit(:active)
  end

end
