class RecipesController < ApplicationController
	def index
	end

	def create

	end

	def your_recipes
		@recipes = Recipe.all
	end

	private
		def recipe_params
			params.require(:recipe).permit(:name, :story)
		end
end