class CommentsController < ApplicationController
  
  def create
    @article = Article.find_by_id params[:id]
    @comment = @article.comments.create(comments_params)
    redirect_to article_path(@article)
  end
  
  private
  
  def comments_params
    params.require(:comments).permit(:commenter, :body)
  end
  
  
end