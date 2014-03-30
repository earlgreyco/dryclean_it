class SessionsController < ApplicationController
	def new
    if current_user
      flash[:error] = "You're already signed in!"
      redirect_to current_user
    end
	end

	def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or customers_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'static_pages/home'
    end
  end

	def destroy
		sign_out
		redirect_to root_url
	end
end
