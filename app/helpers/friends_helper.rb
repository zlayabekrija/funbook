module FriendsHelper
    def notifications_count
        Friend.pendingfriendslist(current_user).count
    end
    def notification_user
        friends = Friend.pendingfriendslist(current_user)
        User.pending(friends).limit(3)
    end
    def notification_time(user)
        Friend.find_by(user_id: user.id, friend_uid:current_user.id).created_at
    end

end
