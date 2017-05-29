class ApplicationController < ActionController::API

  def current_user
    @user = User.find_by auth_token: response.request.env["HTTP_AUTH_TOKEN"]
  end
end
