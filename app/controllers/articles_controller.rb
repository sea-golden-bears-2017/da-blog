class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render :index
  end

  def new
    @article = Article.new()
    render :new
  end

  def create
    article = Article.create(article_params)
    redirect_to article_path(article)
  end

  def show
    @article = Article.find(params[:id])
    render :show
  end

  def edit
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
