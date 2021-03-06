class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, links_attributes: [:id, :original_link])
  end
end
