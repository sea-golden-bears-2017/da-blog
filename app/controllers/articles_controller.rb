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
    @article = given_article
    render :show
  end

  def edit
    @article = given_article
  end

  def update
    article = given_article
    article.update(article_params)
    redirect_to article_path(article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def given_article
    Article.find(params[:id])
  end
end
