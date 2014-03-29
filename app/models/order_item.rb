class OrderItem < ActiveRecord::Base
	belongs_to :order
	validates_presence_of :order_id, :name, :price, :quantity
	scope :dryclean, -> {where(cleaning_method: "dryclean")}
	scope :launder, -> {where(cleaning_method: "launder")}
	scope :other, -> {where(cleaning_method: "other")}

	def self.total_on(date)
    where("date(created_at) = ?", date).sum(:quantity)
  end
end
