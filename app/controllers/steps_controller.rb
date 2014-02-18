class StepsController < ApplicationController
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

	private
		def step_params
			params.require(:step).permit(:description, :recipe_id)
		end
end
