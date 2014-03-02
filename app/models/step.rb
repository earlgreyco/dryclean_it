class Step < ActiveRecord::Base
	belongs_to :recipe

	default_scope -> { order('created_at DESC') }
end
