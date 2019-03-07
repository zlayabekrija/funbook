module CommentsHelper
  def to_show_user_data comment
    User.find(comment.user_id)
  end
  
  def comment_owner?(comment)
    current_user.id == comment.user_id
  end
end
