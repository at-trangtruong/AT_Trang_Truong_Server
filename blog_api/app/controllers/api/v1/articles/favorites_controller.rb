class Api::V1::Articles::FavoritesController < ApplicationController
  before_action :check_login, except: :index

  def index
    articles = Article.joins(:favorites).group(:article_id).select("articles.*, count(favorites.id) as order_item").order("order_item desc").limit(5).includes(:category, :user)
  render json: articles, status: 200, each_serializer: Article::PopularSerializer
  end

  def create
    favorite = Favorite.new favorite_params
    if check_favorite favorite
      render json: {messages: "you liked this article"}, status: 401
    elsif favorite.save
      render json: {is_favorited: true, favorites_count: favorite.count}, status: 200
    else
      render json: {messages: favorite.errors.messages} , status: 401
    end
  end

  def destroy
    favorite = Favorite.find_by favorite_params
    if !check_favorite favorite
      render json: {messages: "you unliked this article"}, status: 401
    elsif favorite.destroy
      render json: {is_favorited: false, favorites_count: favorite.count}, status: 200
    else
      render json: {messages: favorite.errors.messages} , status: 401
    end
  end

  private
  def favorite_params
    {article_id: params[:id], user_id: current_user.id}
  end

  def check_favorite favorite
    (Favorite.find_by article_id: favorite.article_id, user_id: favorite.user_id) ? true : false
  end
end
