class OrderItemsController < ApplicationController
	respond_to :html, :json

	def new
		@order_item = OrderItem.new
	end

	def create
		@order_item = OrderItem.new(order_item_params)
		@order_item.quantity = 1
		@saved = @order_item.save

		@order = @order_item.order
		@order.total_price = @order.total_price + (@order_item.quantity * @order_item.price)
		@order.save!

		respond_to do |format|
			format.js
		end
	end

	def update
		@order_item = OrderItem.find(params[:id])
		@updated = @order_item.update_attributes(order_item_params)
		@order = @order_item.order
		@order.total_price = 0
		@order.order_items.each do |order_item|
			@order.total_price = @order.total_price + order_item.quantity * order_item.price
		end
		@order.save!

		respond_to do |format|
			format.json { respond_with_bip(@order_item) }
			format.js
		end
	end

	private
		def order_item_params
			params.require(:order_item).permit(:order_id, :name, :quantity, :price)
		end
end
