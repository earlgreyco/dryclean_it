class RecipesController < ApplicationController
  def new
  	@recipe = Recipe.new
  end

  def create
  	@recipe = current_user.recipes.build(recipe_params)
  	@saved = @recipe.save
  	if @saved
      flash[:success] = "Added recipe!"
  		redirect_to @recipe
    else
      render 'new'
  	end
  end

  def show
    @recipe = Recipe.friendly.find(params[:id])
    @ingredients = @recipe.ingredients
    @steps = @recipe.steps
  end

  def edit
    @recipe = Recipe.friendly.find(params[:id])
    @ingredient = Ingredient.new
    @ingredient.recipe_id = @recipe.id
    @ingredients = @recipe.ingredients
    @step = Step.new
    @step.recipe_id = @recipe.id
    @steps = @recipe.steps
  end

  def update
    @recipe = Recipe.friendly.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:success] = "Recipe updated!"
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    Recipe.friendly.find(params[:id]).destroy
    flash[:success] = "Recipe deleted."
    redirect_to recipes_url
  end

  def index
  	@recipes = Recipe.all
  end

  private
  	def recipe_params
  		params.require(:recipe).permit(:user_id, :title, :slug, :description, :filepicker_url)
  	end
end
