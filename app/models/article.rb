class Article < ActiveRecord::Base
	belongs_to :user
	has_many :article_images
	validates_presence_of :name, :price, :user_id
end