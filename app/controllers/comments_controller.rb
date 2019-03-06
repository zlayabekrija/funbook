class CommentsController < ApplicationController
  def new
  end

  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to timeline_path
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to timeline_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
