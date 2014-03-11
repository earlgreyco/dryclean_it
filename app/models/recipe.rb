class Recipe < ActiveRecord::Base
	searchkick
	has_many :ingredients, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :recipe_images, dependent: :destroy
	has_many :steps, dependent: :destroy
	validates_presence_of :user_id
	has_reputation :votes, source: :user, aggregated_by: :sum

	default_scope -> { order('time ASC') }
end
