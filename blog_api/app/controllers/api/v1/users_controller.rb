class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:update, :show]
  before_action :check_login, except: [:create, :show]

  def create
    @user = User.new user_params
    if @user.save
      render json: {messages: "signup succsessly"}, status: 200
    else
      render json: {messages: @user.errors.messages}, status: 422
    end
  end

  def update
    if !check_password
      render json: {errors: "old password is incorrect"}, status: 422
    elsif @user.update user_params
      @user.update_searches
      render json: @user, serializer: User::LoginSerializer, status: 200
    else
      render json: {messages: @user.errors}, status: 422
    end
  end

  def show
    followed = current_user.nil? ? false : (current_user.check_followed params[:id])
    render json: @user, serializer: User::ShowSerializer, followed: followed, status: 200
  end

  private
  def user_params
    params.permit :email, :password, :first_name, :last_name, :birthday, :sex, :avatar
  end

  def get_user
    @user = User.find params[:id]
  end

  def check_password
    params[:old_password] != @user.password ? false : true
  end
end
