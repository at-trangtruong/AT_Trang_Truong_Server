class Api::V1::Articles::ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :update, :destroy]

  def index
    current_page = params[:page].blank? ? 1 : params[:page]
    @articles = Article.all.limit(5).offset(5*(current_page.to_i - 1)).includes(:user, :category)
    render json: @articles, each_serializer: Article::IndexSerializer, current_user: current_user, meta: {articlesCount: Article.all.size}
  end

  def show
    followed = current_user.nil? ? false : (current_user.check_followed @article.user_id)
    favorited = current_user.nil? ? false : (current_user.check_favorited @article.id)
    render json: @article, serializer: Article::ShowSerializer, favorited: favorited, followed: followed
  end

  def create
    @article = Article.new article_params
    @article.user_id = current_user.id
    if @article.save
      add_tags
      render json: {messages: "add succsess"}
    else
      render json: {errors: @article.errors}, status: 422
    end
  end

  def update
    check_user_id
    if @article.update article_params
      add_tags
      render json: {messages: "edit succsess"}
    else
      render json: {errors: @article.errors}, status: 422
    end
  end
 

  def destroy
    if @article.destroy
      render json: {messages: "delete succsessly"}, status: 200
    else
      render json: {errors: @article.errors} , status: 401
    end
  end

  private
  def get_article
    @article = Article.find params[:id]
  end

  def article_params
    params.permit :name, :detail, :category_id, :picture
  end

  def add_tags
    tags = params[:tag].split(",")
    Tag.add_tags tags, @article.id
  end

  def check_user_id
    render json: {errors: "not found user_id"}, status: 422 if current_user.id != @article.user_id
  end
end
