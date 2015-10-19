class ReviewsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]

  def new
    @review = Review.new
    @project=Project.find(params[:project_id])
    render :template => "reviews/new"
  end

  def create
    @review = Review.new(project_review_params)
    @project=Project.find(params[:project_id])
    @review.user = current_user

    if @review.save
      redirect_to project_path(@project.id)
    else
      render :template => "reviews/new"
    end
  end

  def edit
    @review = Review.find(params[:id])
    @project=Project.find(params[:project_id])
    render :template => "reviews/edit"
  end

  def update
    @review = Review.find(params[:id])
    @review.user = current_user
    @project=Project.find(params[:project_id])
    if @review.update(project_review_params)
      redirect_to project_path(@project.id)
    else
      render :template => "reviews/edit"
    end
  end

  def destroy
    @project=Project.find(params[:project_id])
    Review.find(params[:id]).destroy!
    redirect_to project_path(@project.id)
  end
  
  def project_review_params
    params.require(:review).permit!
  end

end
