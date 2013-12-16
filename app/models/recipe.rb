class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients
	default_scope -> { order('updated_at DESC') }
	validates_presence_of :user_id, :title, :description
end