class RecipesController < ApplicationController
	respond_to :html, :json

	before_action :signed_in_user, only: [:new, :create, :update, :my_recipes, :index]
  before_action :admin_user,     only: [:index]

  def recipes_home
  	@recipes = Recipe.tally({order: 'vote_count desc'})
  end

  def vote_up
    current_user.vote_for(@recipe = Recipe.find(params[:id]))
    redirect_to :back
  end

  def update
		@recipe = Recipe.find(params[:id])
		@recipe.update_attributes(recipe_params)
		respond_with @recipe
	end

  def show
  	@recipe = Recipe.find(params[:id])
  	@ingredients = @recipe.ingredients
  	@steps = @recipe.steps
  	@recipe_images = @recipe.recipe_images
  	@user = User.where(id: @recipe.user_id).first
  end

  def edit
  	@recipe = Recipe.find(params[:id])
  	@ingredients = @recipe.ingredients
  	@steps = @recipe.steps
  	@recipe_images = @recipe.recipe_images
  	@user = User.where(id: @recipe.user_id).first
  end

	def index
	end

	def new
		@recipe = Recipe.new(recipe_params)
		@ingredients = Ingredient.where(recipe_id: @recipe.id)
		@steps = Step.where(recipe_id: @recipe.id)
		@recipe_images = RecipeImage.where(recipe_id: @recipe.id)
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.user_id = current_user.id
		@saved = @recipe.save

		if @saved
			@recipe_id = @recipe.id
		end

		respond_to do |format|
			format.js
		end
	end

	def my_recipes
		if params[:query].present?
			@recipes = Recipe.search(params[:query], where: {user_id: current_user.id})
		else
			@recipes = Recipe.where(user_id: current_user.id)
		end
	end

	def destroy
		Recipe.find(params[:id]).destroy
	end

	private
		def recipe_params
			params.require(:recipe).permit(:name, :story, :time, :user_id) if params[:recipe]
		end
end