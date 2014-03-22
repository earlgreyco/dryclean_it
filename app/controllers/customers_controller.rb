class CustomersController < ApplicationController
	respond_to :html, :json

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