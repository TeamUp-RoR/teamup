class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @post = Project.new    
  end

  def create
    @post = Project.new(projects_params)
  end

  def edit
  end

  def update
    @project.update(projects_params)

    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy

    redirect_to projects_path 
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def projects_params
    params.require(:project).permit(:name, :description, :goals, :features, :members_limit, :domain, :language, :image_url)
  end
end
