class PostsController < ApplicationController
  
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to timeline_path
  end
  
  def destroy
    post = Post.find(params[:id])
    @user = User.find(post.user_id)
    post.destroy
    stay_on_same_path
  end

  def timeline
    @posts = current_user.posts.all
    friend_by_me = Friend.friendslist(current_user)
    friend_by_them = Friend.requestaccepted(current_user)
    @friend_by_them_posts = Post.friendByThemPosts(friend_by_them)
    @friends_by_me_posts = Post.friendsByMePosts(friend_by_me)
    @all_posts = @posts.or(@friend_by_them_posts).or(@friends_by_me_posts)
    @all_posts = @all_posts.order(created_at: :desc)
  end

  private
  def post_params
    params.permit(:content, post_pic: [])
  end
end

