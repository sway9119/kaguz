class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to login_path
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
