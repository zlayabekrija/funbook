class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create!(post_params)
    redirect_to new_posts_path
  end

  def index
    # @posts = Post.whatever
  end

  private
  def post_params
    params.require(:post).permit(:content, :post_pic)
  end
end
