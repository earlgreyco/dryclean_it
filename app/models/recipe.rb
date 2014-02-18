class Recipe < ActiveRecord::Base
	searchkick
	has_many :ingredients, dependent: :destroy
	has_many :recipe_images, dependent: :destroy
	has_many :steps, dependent: :destroy

	default_scope -> { order('time ASC') }
end
