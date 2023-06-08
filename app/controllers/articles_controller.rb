class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new # Needed to instantiate the form_with
  end

  def create
    @article = Article.new(task_params)
    @article.save # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(article_params) # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to articles_path, status: :see_other
  end

  private

  def task_params
    params.require(:article).permit(:title, :details, :completed)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
