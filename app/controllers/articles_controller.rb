class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.add_categories(categories_ids) unless categories_ids.empty?

    if @article.save
      redirect_to articles_path, notice: "Article was created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(params[:id]), notice: "Article was updated."
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:name, :description, :avatar, :body)
  end

  def categories_ids
    params[:categories][:ids].reject { |id| id.empty? }
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
