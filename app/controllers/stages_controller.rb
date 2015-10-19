class StagesController < ApplicationController


  def new
    @stage = Stage.new
    @project = Project.find(params[:project_id])
    render :template => "stages/new"
  end

  def create
    @stage = Stage.new(project_stage_params)
    @project=Project.find(params[:project_id])
    @stage.project = @project

    if @stage.save
      redirect_to project_path(@project.id)
    else
      render :template => "stages/new"
    end
  end

  def edit
    @stage = Stage.find(params[:id])
    @project=Project.find(params[:project_id])
    render :template => "stages/edit"
  end

  def update
    @stage = Stage.find(params[:id])
    @project=Project.find(params[:project_id])
    if @stage.update(project_stage_params)
      redirect_to project_path(@project.id)
    else
      render :template => "stages/edit"
    end
  end

  def destroy
    @project=Project.find(params[:project_id])
    Stage.find(params[:id]).destroy!
    redirect_to project_path(@project.id)
  end
  
  def project_stage_params
    params.require(:stage).permit!
  end

end
