class ArticlesController < ApplicationController
  before_action :user_is_member?, only: %i[ new create edit update destroy ]
  before_action :set_article, only: %i[show edit update destroy]
  before_action :same_user?, only: %i[ edit update destroy ]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @comment = Comment.new
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
    @article.update_categories(categories_ids) unless categories_ids.empty?

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

  def same_user?
    redirect_to articles_path unless current_user == @article.user || current_user.profile.superadmin?
  end
end
