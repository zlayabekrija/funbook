module CommentsHelper
  def to_show_user_data comment
    User.find(comment.user_id)
  end
end
