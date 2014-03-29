class OrderItem < ActiveRecord::Base
	belongs_to :order
	validates_presence_of :order_id, :name, :price, :quantity

	def self.total_on(date)
    where("date(created_at) = ?", date).sum(:quantity)
  end
end
