class Api::UsersController < ApplicationController

   def index
    binding.pry
  end

  def create
    @user = User.new user_params
    if @user.save
    else
    end
  end

  private
  def user_params
    params.permit :email, :password, :first_name, :last_name, :birthday, :sex
  end
end
