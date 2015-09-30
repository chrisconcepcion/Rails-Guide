class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def edit
    @article = Article.find_by_id params[:id]
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
  
  def update
    @article = Article.find_by_id params[:id]
    @article.update(article_params)
    if @article.save
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end
  
  def destroy
    @article = Article.find_by_id params[:id]
    @article.destroy
    redirect_to articles_path
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end