module PostsHelper
  def is_post_creator_name(creator)
    User.find(creator.user_id).name.capitalize
  end

  def is_post_creator_image(creator)
    User.find(creator.user_id)
  end
  
  def post_owner?(post)
    current_user.id == post.user_id
  end
end
