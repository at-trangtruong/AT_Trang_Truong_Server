class Api::V1::Articles::FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new article_id: params[:article_id], user_id: current_user.id
    if @favorite.save
      render json: {}, status: 200
    else
      render json: {} , status: 401
    end
  end

  def destroy
    @favorite = Favorite.find_by article_id: params[:article_id], user_id: current_user.id
    if @favorite.destroy
      render json: {}, status: 200
    else
      render json: {} , status: 401
    end 
  end
end
