class StaticPagesController < ApplicationController
  def home
  	if current_user
  		@recipes = Recipe.paginate(page: params[:page], per_page: 10)
  	else
  		@recipes = Recipe.find(:all, limit: 5)
  	end
  end
end