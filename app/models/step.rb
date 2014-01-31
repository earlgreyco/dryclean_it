class Step < ActiveRecord::Base
	belongs_to :recipe
	validates_presence_of :recipe_id, :description
	default_scope -> { order('created_at ASC') }
end
