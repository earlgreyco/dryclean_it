class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe
	validates_presence_of :content

	default_scope -> { order('created_at DESC') }
end
