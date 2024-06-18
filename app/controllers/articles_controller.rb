class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(name: params[:article][:name], description: params[:article][:description])
    @article.save

    redirect_to articles_path
  end
end
