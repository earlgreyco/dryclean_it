class IngredientsController < ApplicationController
	respond_to :html, :json

	def new
		@ingredient = Ingredient.new(ingredient_params)
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)
		@recipe = @ingredient.recipe
		@saved = @ingredient.save

		respond_to do |format|
			format.js
		end
	end

	def update
		@ingredient = Ingredient.find(params[:id])
		@ingredient.update_attributes(ingredient_params)
		respond_with @ingredient
	end

	def destroy
		Ingredient.find(params[:id]).destroy
	end

	private
		def ingredient_params
			params.require(:ingredient).permit(:name, :recipe_id)
		end
end