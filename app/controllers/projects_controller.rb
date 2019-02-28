class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.where("deadline >= ?", Date.today)
  end

  def show
  end

  def edit
    unless @project.user_id == current_user
      flash[:alert] = "You can only edit your own projects."
      redirect_to root_path
    end
  end

  def update
    @project.update(project_params)
    if @project.save
      flash[:notice] = "Project updated successfully!"
      redirect_to @project
    else
      flash.now[:alert] = "Changes did not save."
      render :edit
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "New project created!"
      redirect_to @project
    else
      flash.now[:alert] = "There was an error creating the project."
      render :new
    end
  end

  def destroy
    unless @project.user_id == current_user
      flash[:alert] = "You can only delete your own projects."
      redirect_to root_path
    else
      @project.destroy
      redirect_to root_path
    end
  end

private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :funding, :goal, :deadline, :user_id)
  end
end
