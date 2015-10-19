class PagesController < ApplicationController
  def index
  	@projects = Project.all
  	render :template => "pages/index"
  end
end