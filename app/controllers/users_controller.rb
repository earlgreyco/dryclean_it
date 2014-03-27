class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show]
  before_action :correct_user,   only: [:edit, :update, :show]
  before_action :admin_user,     only: :destroy

  def show
  	@user = User.find(params[:id])
    @articles = @user.articles
    @orders = @user.orders
    if params[:query].present?
      @customers = @user.customers.search(params[:query], operator: "or", fields: [{last_name: :word_start}, {phone: :word_start}, {email: :word_start}, {first_name: :word_start}], misspellings: {distance: 2} )
    else
      @customers = @user.customers
    end
    
    @rack_orders = @user.orders
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
    @user.password_confirmation = @user.password
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to Dryclean It!"
  		redirect_to user_path(@user)
  	else
      render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
    if !flash[:notice]
      flash[:notice] = "Make sure to save your changes before leaving this page!"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Profile updated!"
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def index
    @users = User.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :admin, :img, :password, :password_confirmation, :phone, :turnaround_time, :address, :city, :state, :business_hours, :turnaround_time, :search_id)
    end
    
end
