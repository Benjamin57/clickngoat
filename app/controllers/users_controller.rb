class UsersController < ApplicationController
  def index
    @users = scope_policy(User)
  end

  def show
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user.update(user_params)
    authorize @user
    redirect_to users_show_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :email)
  end
end
