class Api::V1::Articles::FavoritesController < ApplicationController

  def index
    articles = Article.joins(:favorites).group(:article_id).select("articles.*, count(favorites.id) as order_item").order("order_item desc").limit(5).includes(:category, :user)
  render json: articles, status: 200, each_serializer: Article::PopularSerializer
  end

  def create
    favorite = Favorite.new article_id: params[:article_id], user_id: current_user.id
    if favorite.save
      render json: {is_favorited: true, favorites_count: favorite.count}, status: 200
    else
      render json: {errors: favorite.errors.messages} , status: 401
    end
  end

  def destroy
    favorite = Favorite.find_by article_id: params[:id], user_id: current_user.id
    if favorite.destroy
      render json: {is_favorited: false, favorites_count: favorite.count}, status: 200
    else
      render json: {errors: favorite.errors.messages} , status: 401
    end 
  end
end
