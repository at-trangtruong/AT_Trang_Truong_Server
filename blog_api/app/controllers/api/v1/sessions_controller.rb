class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by user_params
      binding.pry
    if @user && (@user.password == user_params["password"])
      @user.update auth_token: (SecureRandom.hex + "/" + Time.now.to_s)
      render json: @user, serializer: User::LoginSerializer, status: 200
    else
      render json: {}, status: 422
    end
  end

  def destroy
    
  end

  private
  def user_params
    params.permit :email, :password
  end

end
