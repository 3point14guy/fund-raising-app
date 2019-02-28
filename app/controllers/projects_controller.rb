class ProjectsController < ApplicationController

  def index
    @projects = Project.where("deadline >= ?", Date.today)
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    if @project.save
      flash[:notice] = "Project updated successfully!"
      redirect_to @project
    else
      flash.now[:alert] = "Changes did not save."
      render edit
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
      render new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root
  end

private
  def project_params
    params.require(:project).permit(:title, :description, :funding, :goal, :deadline)
  end
end
