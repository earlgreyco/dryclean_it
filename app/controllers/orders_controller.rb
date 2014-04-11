class OrdersController < ApplicationController
	respond_to :html, :json

	def customer_receipt
		@order = Order.find(params[:id])
		@dashboard = false
	end

	def business_receipt
		@order = Order.find(params[:id])
		@dashboard = false
	end

	def reports
		@orders = current_user.orders
		if params[:query].present?
			@orders = current_user.orders.search(params[:query])
		else
			@orders = @orders
		end
	end

	def rack_it
		@orders = current_user.orders
		if params[:query].present?
      @order = @orders.recent_ones_first.search(params[:query], operator: "or", fields: [{order_number: :word_start}], misspellings: {distance: 2}).first
    end
	end

	def index
		@orders = current_user.orders
		if params[:query].present?
      @orders = @orders.recent_ones_first.search(params[:query], operator: "or", fields: [{order_number: :word_start}, {tag_number: :word_start}, {total_price: :word_start}], misspellings: {distance: 2})
    else
      @orders = @orders.recent_ones_first.paginate(page: params[:page], per_page: 20)
    end
	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id

		if Order.last != nil
			@order.order_number = (Order.last.id+1).to_s
		else
			@order.order_number = "0"
		end

    @order.pickup_date = DateTime.now + current_user.turnaround_time.days
    if @order.pickup_date.strftime("%a") == "Sun"
    	@order.pickup_date = @order.pickup_date + 1.day
    end
		@saved = @order.save

		respond_to do |format|
			format.js
		end
	end

	def update
		@order = Order.find(params[:id])
		@rack_number_changed = false
		@updated = @order.update_attributes(order_params)
		if @order.rack_number != nil && @order.rack_number != ""
			@rack_number_changed = true
		end
		respond_to do |format|
			format.json { respond_with_bip(@order) }
			format.js
		end
	end

	def save_pickup_date
		@order = Order.find(params[:id])
		@order.pickup_date = DateTime.now
		@order.picked_up = true
		@order.save!
	end

	def reverse_pickup
		@order = Order.find(params[:id])
		@order.pickup_date = DateTime.now + current_user.turnaround_time.days
		if @order.pickup_date.strftime("%a") == "Sun"
    	@order.pickup_date = @order.pickup_date + 1.day
    end
		@order.picked_up = false
		@order.save!
	end

	def use_store_credits
		@order = Order.find(params[:id])
		@customer = @order.customer
		@payment_left = @order.total_price - @customer.credits
		@customer.deduct_credits(@payment_left)
		@order.recalculate_total_price_with_credits(@payment_left)
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
			params.require(:order).permit(:rack_number, :picked_up, :pickup_date, :user_id, :customer_id, :total_price, :payment_type, :tag_number, :racked, :credits_used, :order_number)
		end
end
