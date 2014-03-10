class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@saved = @comment.save

		respond_to do |format|
			format.js
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:content, :recipe_id, :user_id)
		end
end
