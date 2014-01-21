class StaticPagesController < ApplicationController
  def home
  	if current_user
  		@recipes = Recipe.where(visible: true).paginate(page: params[:page], per_page: 10)
  	else
  		@recipes = Recipe.where(visible: true).find(:all, limit: 5)
  	end
  end
end