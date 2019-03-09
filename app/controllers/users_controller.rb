class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_with_password(user_params)
    # sign_in(@user, bypass: true)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:password,:name,:profile_pic,:dob,:email,:current_password)
  end
end
