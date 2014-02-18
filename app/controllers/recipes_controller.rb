class RecipesController < ApplicationController
	def index
		if params[:query].present?
			@recipes = Recipe.search(params[:query])
		else
			@recipes = Recipe.all
		end
	end

	def new
		@recipe = Recipe.new(recipe_params)
		@ingredients = Ingredient.where(recipe_id: @recipe.id)
		@steps = Step.where(recipe_id: @recipe.id)
		@recipe_images = RecipeImage.where(recipe_id: @recipe.id)
	end

	def create
		@recipe = Recipe.new(recipe_params)
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
	end

	private
		def recipe_params
			if params[:recipe].present?
				params.require(:recipe).permit(:name, :story, :time)
			end
		end
end