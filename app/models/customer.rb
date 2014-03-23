class Customer < ActiveRecord::Base
	searchkick word_start: [:first_name, :last_name, :phone, :email]
	belongs_to :user
	has_many :orders
	validates_presence_of :first_name, :last_name, :phone
	default_scope -> { order('created_at DESC') }
end