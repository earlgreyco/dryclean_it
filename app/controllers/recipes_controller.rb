class RecipesController < ApplicationController
	def index
	end

	def new
	end

	def create
	end

	def your_recipes
		@recipes = Recipe.all
	end
end
