class OrderItem < ActiveRecord::Base
	belongs_to :order
	validates_presence_of :order_id, :name, :price, :quantity
end
