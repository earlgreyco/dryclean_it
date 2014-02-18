class RecipesController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :update, :your_recipes, :index]
  before_action :admin_user,     only: [:index]

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

	def update
		@recipe = Recipe.find(params[:id])
		@updated = @recipe.update_attributes(recipe_params)
	end

	def your_recipes
		if params[:query].present?
			@recipes = Recipe.search(params[:query], where: {user_id: current_user.id})
		else
			@recipes = Recipe.where(user_id: current_user.id)
		end
	end

	private
		def recipe_params
			if params[:recipe].present?
				params.require(:recipe).permit(:name, :story, :time, :user_id)
			end
		end
end