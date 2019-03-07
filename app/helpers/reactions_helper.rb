module ReactionsHelper
  def likes_counter(resource)
    resource.reactions.where(like: true).count
  end

  def dislikes_counter(resource)
    resource.reactions.where(dislike: true).count
  end
  
 
end
