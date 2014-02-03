class IngredientsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :new, :create, :destroy]
  before_action :admin_user, only: [:edit, :update, :new, :create, :destroy]
	def new
  	@ingredient = Ingredient.new
  end

  def create
  	@ingredient = Ingredient.new(ingredient_params)
  	@saved = @ingredient.save
  	if @saved
  		flash[:success] = "Added ingredient!"
  		redirect_to edit_recipe_path(@ingredient.recipe)
  	else
  		render 'new'
  	end
  end

  def edit
  	@ingredient = Ingredient.find(params[:id])
  end

  def update
  	@ingredient = Ingredient.find(params[:id])
  	if @ingredient.update_attributes(ingredient_params)
			flash[:success] = "Ingredient updated!"
			redirect_to edit_recipe_path(@ingredient.recipe)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@ingredient = Ingredient.find(params[:id])
    @recipe = @ingredient.recipe
  	@ingredient.destroy

    @ingredients = @recipe.ingredients

    respond_to do |format|
      format.js
    end
  end

  private
  	def ingredient_params
  		params.require(:ingredient).permit(:recipe_id, :title, :quantity)
  	end
end
