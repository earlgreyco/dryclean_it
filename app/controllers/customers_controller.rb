class CustomersController < ApplicationController
	respond_to :html, :json

	def index
		@customers = current_user.customers
		if params[:query].present?
      @customers = @customers.recent_ones_first.search(params[:query], operator: "or", fields: [{last_name: :word_start}, {phone: :word_start}, {email: :word_start}, {first_name: :word_start}], misspellings: {distance: 2} )
    else
      @customers = @customers.recent_ones_first
    end
	end

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.new(customer_params)
		@customer.user_id = current_user.id
		@saved = @customer.save

		respond_to do |format|
			format.js
		end
	end

	def update
		@customer = Customer.find(params[:id])
		@customer.update_attributes(customer_params)
		respond_with @customer
	end

	def destroy
		Customer.find(params[:id]).destroy
	end

	private
		def customer_params
			params.require(:customer).permit(:first_name, :last_name, :img, :phone, :email, :starch, :credits, :note, :user_id)
		end
end