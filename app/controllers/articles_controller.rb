class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all.order('created_at DESC').paginate(page: params[:page], per_page: 6)
    end
  end

  def show
  end

  def new
    @user = User.find_by(params[:id])
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to new_article_path, notice: 'Article was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url 
  end

private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :url, :promoted, :tag_list, :source)
  end
end
