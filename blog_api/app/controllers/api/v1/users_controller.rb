class Api::V1::UsersController < ApplicationController

   def index
    binding.pry
  end

  def create
    @user = User.create user_params
    if @user.save
      render json: @user, serializer: User::LoginSerializer, status: 200
    else
      render json: {"errors"}, status: 422
    end
  end

  def update
    
  end

  private
  def user_params
    params.permit :email, :password, :first_name, :last_name, :birthday, :sex
  end
end
