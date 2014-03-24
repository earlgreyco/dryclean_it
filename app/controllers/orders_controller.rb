class OrdersController < ApplicationController
	respond_to :html, :json

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		@saved = @order.save

		respond_to do |format|
			format.js
		end
	end

	def update
		@order = Order.find(params[:id])
		@order.update_attributes(order_params)
		respond_with @order
	end

	private
		def order_params
			params.require(:order).permit(:user_id, :customer_id, :total_price, :payment_type)
		end
end
