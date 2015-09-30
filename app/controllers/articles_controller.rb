class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find_by_id (params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "New Article Published!"
      redirect_to article_path(@article.id)
    else
      flash[:error] = @article.errors.messages[:title]
      render :new
    end
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end