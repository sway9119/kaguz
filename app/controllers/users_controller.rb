class UsersController < ApplicationController
  
  layout "home"

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to login_path
  end

  def show
    @user = User.find(current_user.id)
    @workshops = User.find(current_user.id).workshops
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
