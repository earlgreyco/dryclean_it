class StepsController < ApplicationController
	before_action :admin_user, only: [:edit, :update, :new, :create, :destroy]

	def new
		@step = Step.new
	end

	def create
		@step = Step.new(step_params)
		@saved = @step.save
		if @saved
			flash[:success] = "Added step!"
			redirect_to edit_recipe_path(@step.recipe)
		else
			render 'new'
		end
	end

	def edit
		@step = Step.find(params[:id])
	end

	def update
		@step = Step.find(params[:id])
		if @step.update_attributes(step_params)
			flash[:success] = "Step updated!"
			redirect_to edit_recipe_path(@step.recipe)
		else
			render 'edit'
		end
	end

	def destroy
		@step = Step.find(params[:id])
		@step.destroy
		flash[:success] = "Step deleted."
		redirect_to edit_recipe_path(@step.recipe)
	end

	private
		def step_params
			params.require(:step).permit(:recipe_id, :description, :filepicker_url)
		end
end
