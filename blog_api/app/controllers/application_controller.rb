class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def check_login
    render json: {errors: "Please login"}, status: 403 unless (current_user && current_user.check_auth_token)
  end

  def current_user
    @current_user ||= User.find_by auth_token: response.request.env["HTTP_AUTH_TOKEN"]
  end

  private
  def show_errors
    render json: {messages: "Not found"}, status: 404
  end
end
