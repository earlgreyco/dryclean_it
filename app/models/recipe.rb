class Recipe < ActiveRecord::Base
	searchkick
	has_many :ingredients, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :recipe_images, dependent: :destroy
	has_many :steps, dependent: :destroy
	validates_presence_of :user_id
	has_reputation :votes, source: :user, aggregated_by: :sum
	default_scope -> { order('time ASC') }

	def clone_with_associations(current_user, recipe)
		recipe.user_id = current_user.id
		recipe.clone = true
		recipe.story = " "
    new_recipe = recipe.dup :include => [:steps, :ingredients]
    new_recipe
  end
end