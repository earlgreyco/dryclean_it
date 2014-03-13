class StepsController < ApplicationController
	respond_to :html, :json

	def new
		@step = Step.new(step_params)
	end

	def create
		@step = Step.new(step_params)
		@saved = @step.save
		@recipe = @step.recipe

		respond_to do |format|
			format.js
		end
	end

	def update
		@step = Step.find(params[:id])
		@step.update_attributes(step_params)
		respond_with @step
	end

	def destroy
		Step.find(params[:id]).destroy
	end

	private
		def step_params
			params.require(:step).permit(:description, :recipe_id)
		end
end
