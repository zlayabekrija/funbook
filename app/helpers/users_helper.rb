module UsersHelper
    def my_posts user
        Post.myPosts(user)
    end
end
