class Recipe < ActiveRecord::Base
	searchkick
	acts_as_voteable
	has_many :ingredients, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :recipe_images, dependent: :destroy
	has_many :steps, dependent: :destroy
	validates_presence_of :user_id

	def clone_recipe(current_user)
		new_recipe = self

		new_recipe.user_id = current_user.id
		new_recipe.clone = true
		new_recipe.story = " "

		new_recipe.steps = self.steps
		new_recipe.ingredients = self.ingredients
		new_recipe.recipe_images = self.recipe_images

		new_recipe.save
    new_recipe
  end
end