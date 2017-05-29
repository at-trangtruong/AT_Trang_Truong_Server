class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by user_params
    if @user
      @user.update_attributes auth_token: SecureRandom.hex, session_time: Time.now
      render json: @user, serializer: User::LoginSerializer, status: 200
    else
      render json: {errors: "errors"}, status: 401
    end
  end

  private
  def user_params
    params.require("session").permit :email, :password
  end

end
