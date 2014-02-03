class IngredientType < ActiveRecord::Base
	validates_presence_of :name, :definition
	default_scope -> { order('updated_at DESC') }
end