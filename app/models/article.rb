class Article < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name, :price, :user_id
	default_scope -> { order('created_at ASC') }
end