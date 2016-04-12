class UsersController < ApplicationController
  def index
    @users = User.all
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully deleted user!"
    redirect_to users_path
  end


end
