class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]
  
  def index
    @projects = Project.all
    render :template => "projects/index"
  end

  def show
    @project = Project.find(params[:id])
    render :template => "projects/show"
  end

  def new
    @project = Project.new
    render :template => "projects/new"
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to project_path(@project.id)
    else
      render :template => "projects/new"
    end
  end

  def edit
    @project = Project.find(params[:id])
    render :template => "projects/edit"
  end

  def update
    @project = Project.find(params[:id])
    @project.user = current_user
    if @project.update(project_params)
      redirect_to project_path
    else
      render :template => "projects/edit"
    end
  end

  def destroy
    Project.find(params[:id]).destroy!
    redirect_to projects_path
  end
  
  def project_params
    params.require(:project).permit!
  end

end
