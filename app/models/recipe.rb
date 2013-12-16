class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :steps, dependent: :destroy
	default_scope -> { order('created_at DESC') }
	validates_presence_of :user_id, :title, :slug, :description
	validates :title, uniqueness: { case_sensitive: false }
	extend FriendlyId
	friendly_id :title, use: :slugged
end