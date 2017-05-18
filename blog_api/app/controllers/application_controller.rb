class ApplicationController < ActionController::API

  def check_login
    @user = User.find_by auth_token: params[:auth_token]
    return @user && @user.params == params[:auth_token] ? true : false
  end

  def current_user
    @user = User.find_by auth_token: params[:auth_token]
  end
end
