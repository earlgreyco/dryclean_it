class StaticPagesController < ApplicationController
  def home
  @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end
end