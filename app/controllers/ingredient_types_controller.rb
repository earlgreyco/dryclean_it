class IngredientTypesController < ApplicationController
	before_action :signed_in_user
	before_action :admin_user

  def new
  	@ingredient_type = IngredientType.new
  end

  def create
  	@ingredient_type = IngredientType.new(ingredient_type_params)
  	@saved = @ingredient_type.save
  	if @saved
  		flash[:success] = "Added Ingredient Type!"
  		redirect_to ingredient_types_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@ingredient_type = IngredientType.find(params[:id])
  end

  def update
  	@ingredient_type = IngredientType.find(params[:id])
  	if @ingredient_type.update_attributes(ingredient_type_params)
  		flash[:success] = "Ingredient type updated!"
  		redirect_to ingredient_types_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	IngredientType.find(params[:id]).destroy
    flash[:success] = "Ingredient type deleted."
    redirect_to ingredient_types_url
  end

  def index
  	@ingredient_types = IngredientType.all
  end

  private
  	def ingredient_type_params
  		params.require(:ingredient_type).permit(:name, :definition, :link, :img)
  	end
end
