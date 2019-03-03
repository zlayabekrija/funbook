class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to timeline_path
  end

  # def index
  #   @posts = current_user.posts.all
  # end

  def timeline
    @posts = current_user.posts.all
  end

  private
  def post_params
    params.permit(:content, post_pic: [])
  end
end
