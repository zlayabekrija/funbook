class Post < ApplicationRecord
  belongs_to :user
  has_many :reactions, as: :resource, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :post_pic
  validates :content, length: {maximum: 120}
  validate :check_for_presence

  def self.friendByThemPosts friends
    Post.where(user_id: friends.collect(&:user_id))
  end

  def self.friendsByMePosts friends
    Post.where(user_id: friends.collect(&:friend_uid))
  end

  protected

  def check_for_presence
    if !image && content.empty?
      errors.add(:image, :content, message: "should have image or text at least")
    end
  end
end
