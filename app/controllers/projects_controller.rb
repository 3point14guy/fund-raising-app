class ProjectsController < ApplicationController

  def index
    @projects = Project.all
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
      flash[:notice] = "Project updated successfully"
      redirect_to @project
    else
      flash.now[:alert] = "Changes did not save"
      render edit
    end
  end

private
  def project_params
    params.require(:project).permit(:title, :description, :funding, :goal, :deadline)
  end
end
