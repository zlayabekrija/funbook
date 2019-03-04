class Friend < ApplicationRecord
  belongs_to :user
  validates :friend_uid, presence: true
  validate :stop_self_request
  scope :friendslist,->(current_user){ where("user_id = ? AND friends = true",current_user) }
  scope :cancelrequest,->(current_user){ where("user_id = ? AND friends = false",current_user) }
  scope :pendingfriendslist,->(current_user){ where("friend_uid = ? AND friends = false ", current_user) }
  scope :requestaccepted,->(current_user){ where("friend_uid = ? AND friends = true ", current_user) }
  protected
  def stop_self_request
    if friend_uid == user.id
      errors.add(:friend_uid, "Don't be too much in love with yourself!!!")
    end
  end
end
