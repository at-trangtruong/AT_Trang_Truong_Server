class Api::V1::Articles::ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :update, :destroy]
  before_action :check_login, only: [:update, :create, :destroy]
  def index
    current_page = params[:page].blank? ? 1 : params[:page]
    @articles = Article.all.limit(5).offset(5*(current_page.to_i - 1)).includes(:user, :category)
    render json: @articles, each_serializer: Article::IndexSerializer, current_user: current_user, meta: {articlesCount: @articles.size}
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
      @article.add_tags params[:tag] unless params[:tag].blank?
      render json: @article, status: 200
    else
      render json: {messages: @article.errors}, status: 422
    end
  end

  def update
    if !check_user_article
      render json: {messages: "This article is not your"}, status: 401
    elsif @article.update article_params
      @article.add_tags params[:tag] unless params[:tag].blank?
      render json: @article, status: 200
    else
      render json: {messages: @article.errors}, status: 422
    end
  end

  def destroy
    check_user_article
    if @article.destroy
      render json: {messages: "delete succsessly"}, status: 200
    else
      render json: {messages: @article.errors} , status: 401
    end
  end

  private
  def get_article
    @article = Article.find params[:id]
  end

  def article_params
    params.permit :name, :detail, :category_id, :picture
  end

  def check_user_article
    current_user.id != @article.user_id ? false : true
  end
end
