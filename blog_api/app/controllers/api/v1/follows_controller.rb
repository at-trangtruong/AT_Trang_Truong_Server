class Api::V1::FollowsController < ApplicationController
  before_action :check_login

  def create
    follow = Follow.new follow_params
    if check_follow follow
      render json: {messages: "you followed this user"}, status: 401
    elsif follow.save
      render json: {is_followed: true}, status: 200
    else
      render json: {errors: follow.errors.messages} , status: 401
    end
  end

  def destroy
    follow = Follow.find_by follow_params
    if !check_follow follow
      render json: {messages: "you unfollow this user"}, status: 401
    elsif follow.destroy
      render json: {is_followed: false}, status: 200
    else
      render json: {errors: follow.errors.messages} , status: 401
    end
  end

  private
  def follow_params
    {followed_user_id: params[:id], follower_user_id: current_user.id}
  end

  def check_follow follow
    (Follow.find_by followed_user_id: follow.followed_user_id, follower_user_id: follow.follower_user_id) ? true : false
  end
end
