class Customer < ActiveRecord::Base
	searchkick word_start: [:first_name, :last_name, :phone, :email]
	belongs_to :user
	has_many :orders
	validates_presence_of :first_name, :last_name, :phone
	scope :recent_ones_first, -> {order('created_at DESC')}

	def deduct_credits(payment_left)
		if payment_left <= 0
			self.credits = -payment_left
		else
			self.credits = 0
		end
		self.save!
	end
end