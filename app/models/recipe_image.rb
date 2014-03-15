class RecipeImage < ActiveRecord::Base
	belongs_to :recipe
	default_scope -> { order('created_at ASC') }
end
