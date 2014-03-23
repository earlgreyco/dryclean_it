class Order < ActiveRecord::Base
	has_many :order_items
	belongs_to :user
	belongs_to :customer
	validates_presence_of :customer_id, :user_id, :total_price
end