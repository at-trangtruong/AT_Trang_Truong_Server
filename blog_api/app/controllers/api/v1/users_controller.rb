class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:update, :show]

  def create
    @user = User.new user_params
    if @user.save
      render json: {messages: "signup succsessly"}, status: 200
    else
      render json: {errors: @user.errors.messages}, status: 422
    end
  end

  def update
    binding.pry
    if @user.update user_params
      render json: @user, serializer: User::LoginSerializer, status: 200
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  def show
    render json: @user, serializer: User::ShowSerializer, status: 200
  end

  private
  def user_params
    params.permit :email, :password, :first_name, :last_name, :birthday, :sex, :avatar
  end

  def get_user
    @user = User.find params[:id]
  end
end
