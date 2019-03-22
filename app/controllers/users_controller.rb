class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    c = @user.posts.ids
    @user_photos = ActiveStorage::Attachment.where(record_type:'Post').where(record_id:c).where.not(name:'profile_pic').order(created_at: :desc).limit(8)
  end
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_with_password(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:password,:name,:profile_pic,:dob,:email,:current_password)
  end
end
