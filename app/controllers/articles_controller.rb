class ArticlesController < ApplicationController
  respond_to :html, :json

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	@article.user_id = current_user.id

    @saved = @article.save

  	respond_to do |format|
  		format.js
  	end
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    respond_with @article
  end

  def destroy
    Article.find(params[:id]).destroy
  end

  private

    def article_params
      params.require(:article).permit(:name, :price, :user_id, :img)
    end 
end
