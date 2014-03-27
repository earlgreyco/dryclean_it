class OrdersController < ApplicationController
	respond_to :html, :json

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		@order.pickup_date = DateTime.now + current_user.turnaround_time.days
		@order.search_id = @order.id.to_s
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

	def save_pickup_date
		@order = Order.find(params[:id])
		@order.pickup_date = DateTime.now
		@order.picked_up = true
		@order.save!
	end

	def use_store_credits
		@order = Order.find(params[:id])
		@customer = @order.customer
		@credits = @customer.credits
		@payment_left = @order.total_price - @credits

		#Too many
		if @payment_left < 0
			@order.credits_used = @order.total_price
			@customer.credits = -@payment_left
			@order.total_price = 0
		
		#Just enough or too little
		else
			@order.credits_used = @customer.credits
			@customer.credits = 0
			@order.total_price = @payment_left
		end

		@order.save!
		@customer.save!
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
			params.require(:order).permit(:picked_up, :pickup_date, :user_id, :customer_id, :total_price, :payment_type, :tag_number, :racked, :credits_used)
		end
end
