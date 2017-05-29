class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by user_params
    if @user && (@user.password == user_params["password"])
      @user.update_attributes auth_token: SecureRandom.hex, session_time: Time.now
      render json: @user, serializer: User::LoginSerializer, status: 200
    else
      render json: {errors: "errors"}, status: 422
    end
  end

  def destroy
    
  end

  private
  def user_params
    params.require("session").permit :email, :password
  end

end
