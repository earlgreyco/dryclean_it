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
		@updated = @order.update_attributes(order_params)
		respond_with @order
	end

	def add_cash_type
		@order = Order.find(params[:id])
		@order.payment_type = "cash"
		@order.save
	end

	def add_card_type
		@order = Order.find(params[:id])
		@order.payment_type = "card"
		@order.save
	end

	def add_check_type
		@order = Order.find(params[:id])
		@order.payment_type = "check"
		@order.save
	end

	def load_order_price
	  respond_to do |format|               
	    format.js
	  end
	end

	private
		def order_params
			params.require(:order).permit(:user_id, :customer_id, :total_price, :payment_type)
		end
end
