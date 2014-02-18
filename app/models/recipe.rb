class Recipe < ActiveRecord::Base
	has_many :ingredients, dependent: :destroy
	has_many :recipe_images, dependent: :destroy
	has_many :steps, dependent: :destroy
end
