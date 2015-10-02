class CommentsController < ApplicationController
  
  def create
    @article = Article.find_by_id params[:article_id]
    @comment = @article.comments.create(comments_params)
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find_by_id params[:article_id]
    @comment = Comment.find_by_id params[:id]
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  private
  
  def comments_params
    params.require(:comment).permit(:commenter, :body)
  end
  
  
end