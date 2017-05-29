module Api::V1
  class ArticlesController < ApplicationController
    before_action :get_article, only: [:show, :update, :destroy]
    def index
      @articles = Article.all.includes(:user, :category)
      render json: @articles, each_serializer: Article::IndexSerializer
    end

    def show
      favorited = current_user.check_followed @article.user_id
      followed = current_user.check_favorited @article.id
      render json: @article, serializer: Article::ShowSerializer, favorited: favorited, followed: followed
    end

    def create
      @article = Article.new article_params
      @article.user_id = current_user.id
      if @article.save
        tags = params[:tag].split(",")
        Tag.add_tags tags, @article.id
        render json: @article, status: 200
      else
        render json: {errors: @article.errors}, status: 422
      end
    end

    def update
      if @article.update article_params
        tags = [:tag].split(",")
        Tag.add_tags tags, @article.id
      else
        render json: {errors: @article.errors}, status: 422
      end
    end

    private
    def get_article
      @article = Article.find params[:id]
    end

    def article_params
      params.permit :name, :detail, :category_id, :picture
    end
  end
end
