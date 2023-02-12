class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # view the form
  def new
    @article = Article.new
  end

  #actually create the thing
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # for just creating the form - view
  def edit
    @article = Article.find(params[:id])
  end
  # for actually updating it - post
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #post request - actually delete the thing
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, stats: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
