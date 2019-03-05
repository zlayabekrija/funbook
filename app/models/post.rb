class Post < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :post_pic
  validates :content, length: {maximum: 120}
  validate :check_for_presence

  protected

  def check_for_presence
    if !image && content.empty?
      errors.add(:image, :content, message: "should have image or text at least")
    end
  end
end
