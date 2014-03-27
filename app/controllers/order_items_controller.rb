class OrderItemsController < ApplicationController
	respond_to :html, :json

	def new
		@order_item = OrderItem.new
	end

	def create
		@order_item = OrderItem.new(order_item_params)
		@saved = @order_item.save
		@order = @order_item.order
		@order.recalculate_total_price

		respond_to do |format|
			format.js
		end
	end

	def update
		@order_item = OrderItem.find(params[:id])
		@updated = @order_item.update_attributes(order_item_params)
		@order = @order_item.order
		@order.recalculate_total_price

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
