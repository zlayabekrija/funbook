class Friend < ApplicationRecord
  belongs_to :user
  validates :friend_uid, presence: true
  validate :stop_self_request

  protected
  def stop_self_request
    if friend_uid == user.id
      errors.add(:friend_uid, "Don't be too much in love with yourself!!!")
    end
  end
end
