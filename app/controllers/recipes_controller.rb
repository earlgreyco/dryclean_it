class RecipesController < ApplicationController
	def index
	end

	def new
		@recipe = Recipe.new(recipe_params)
		@ingredients = Ingredient.all
		@steps = Step.all
		@recipe_images = RecipeImage.all
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@saved = @recipe.save
	end

	def update
		@recipe = Recipe.find(params[:id])
		@updated = @recipe.update_attributes(recipe_params)
	end

	def your_recipes
		@recipes = Recipe.all
	end

	private
		def recipe_params
			if params[:recipe].present?
				params.require(:recipe).permit(:name, :story)
			end
		end
end