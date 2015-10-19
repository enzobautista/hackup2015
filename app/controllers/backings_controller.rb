class BackingsController < ApplicationController

  def new
    @backing = Backing.new
    # @backing = Backing.new(:express_token => params[:token])
    @project=Project.find(params[:project_id])
    render :template => "backings/new"
  end

  def create
    @backing = Backing.new(project_backing_params)
    @project=Project.find(params[:project_id])
    @backing.user = current_user

    if @backing.save
      @new_amount = @project.current_amount + @backing.amount
      @project.update_attribute(:current_amount, @new_amount)
      # redirect_to project_path(@project.id)
      redirect_to @backing.paypal_url(project_path(@project.id))
    else
      render :template => "backings/new"
    end
  end
  
  def project_backing_params
    params.require(:backing).permit!
  end


end
