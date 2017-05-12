class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by user_params
    if @user
     # log_in @user
     binding.pry
      redirect_to api_home_url
    else
      render json: {errors: "loi"}, status: 422
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  private
  def user_params
    params.permit :email, :password
  end

end
