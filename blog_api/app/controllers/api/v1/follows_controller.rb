class Api::V1::FollowsController < ApplicationController

  def create
    follow = Follow.new followed_user_id: params[:user_id], follower_user_id: current_user.id
    if follow.save
      render json: {is_followed: true}, status: 200
    else
      render json: {errors: follow.errors.messages} , status: 401
    end
  end

  def destroy
    follow = Follow.find_by followed_user_id: params[:id], follower_user_id: current_user.id
    if follow.destroy
      render json: {is_followed: false}, status: 200
    else
      render json: {errors: follow.errors.messages} , status: 401
    end 
  end
end
