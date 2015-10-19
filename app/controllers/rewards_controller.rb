class RewardsController < ApplicationController

  def new
    @reward = Reward.new
    @project = Project.find(params[:project_id])
    render :template => "rewards/new"
  end

  def create
    @reward = Reward.new(project_reward_params)
    @project = Project.find(params[:project_id])
    @reward.project = @project

    if @reward.save
      redirect_to project_path(@project.id)
    else
      render :template => "rewards/new"
    end
  end

  def edit
    @reward = Reward.find(params[:id])
    @project=Project.find(params[:project_id])
    render :template => "rewards/edit"
  end

  def update
    @reward = Reward.find(params[:id])
    @project=Project.find(params[:project_id])
    if @reward.update(project_reward_params)
      redirect_to project_path(@project.id)
    else
      render :template => "rewards/edit"
    end
  end

  def destroy
    @project=Project.find(params[:project_id])
    Reward.find(params[:id]).destroy!
    redirect_to project_path(@project.id)
  end
  
  def project_reward_params
    params.require(:reward).permit!
  end

end
