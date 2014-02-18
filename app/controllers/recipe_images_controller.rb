class RecipeImagesController < ApplicationController
	def new
		@recipe_image = RecipeImage.new(recipe_image_params)
	end

	def create
		@recipe_image = RecipeImage.new(recipe_image_params)
		@saved = @recipe_image.save

		respond_to do |format|
			format.js
		end
	end

	private
		def recipe_image_params
			params.require(:recipe_image).permit(:img, :recipe_id)
		end
end