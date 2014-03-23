class Customer < ActiveRecord::Base
	searchkick word_start: [:first_name, :last_name, :phone, :email]
	belongs_to :user
	validates_presence_of :first_name, :last_name, :phone
end