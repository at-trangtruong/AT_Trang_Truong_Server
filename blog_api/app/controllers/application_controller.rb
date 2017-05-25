class ApplicationController < ActionController::API

  def check_login
    render json: {errors: "Please login"}, status: 403 unless (current_user && current_user.check_auth_token)
  end

  def current_user
    @current_user ||= User.find_by auth_token: response.request.env["HTTP_AUTH_TOKEN"]
  end
end
