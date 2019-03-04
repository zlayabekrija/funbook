class FriendsController < ApplicationController
  def new
    @friend = current_user.friends.new
  end
  def index 
    friends = Friend.friendslist(current_user)
    @friends = User.myfriends(friends)
    pending = Friend.pendingfriendslist(current_user)
    @pending = User.pending(pending)
    accepted = Friend.requestaccepted(current_user)
    @accepted = User.requestaccepted(accepted)
    @others = User.others(current_user.friends.all,current_user)
    cancelrequest = Friend.cancelrequest(current_user)
    @cancelrequest = User.myfriends(cancelrequest)
  end

  def create
    add_friend = current_user.friends.build(params_friend)
    add_friend.save
    redirect_to friends_path
  end

  def update
    accept = Friend.find_by(user_id:params[:id],friend_uid:current_user.id)
    accept.update_attributes(friends: true)
    redirect_to friends_path
  end
  
  def destroy
    unfriend = Friend.find_by(friend_uid: params[:id],user_id:current_user.id)
    unfriend ||= Friend.find_by(friend_uid:current_user.id,user_id: params[:id])
    unfriend.destroy
    redirect_to friends_path
  end
  private
  def params_friend
    params.permit(:friend_uid,:user_id)
  end
end
