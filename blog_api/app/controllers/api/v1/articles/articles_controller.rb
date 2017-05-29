class Api::V1::Articles::ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all.includes(:user, :category)
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
      tags = params[:article][:tag].split(",")
      Tag.add_tags tags, @article.id
      render json: {messages: "add succsess"}
    else
      render json: {errors: @article.errors}, status: 422
    end
  end

  def update
    if @article.update article_params
      tags = params[:article][:tag].split(",")
      Tag.add_tags tags, @article.id
      render json: {messages: "edit succsess"}
    else
      render json: {errors: @article.errors}, status: 422
    end
  end

  private
  def get_article
    @article = Article.find params[:id]
  end

  def article_params
    params.require("article").permit :name, :detail, :category_id, :picture
  end

end
