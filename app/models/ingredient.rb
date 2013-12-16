class Ingredient < ActiveRecord::Base
	belongs_to :recipe
	default_scope -> { order('updated_at DESC') }
	validates_presence_of :recipe_id, :title, :quantity
	validates :quantity, numericality: true
end
