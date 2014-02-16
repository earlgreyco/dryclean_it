class IngredientsController < ApplicationController
	def new
		@ingredient = Ingredient.new(ingredient_params)
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)
		@saved = @ingredient.save

		respond_to do |format|
			format.js
		end
	end

	private
		def ingredient_params
			params.require(:ingredient).permit(:name)
		end
end