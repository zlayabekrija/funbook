class Post < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :content, length: {maximum: 120}
  validate :check_for_presence

  protected
  def check_for_presence
    if !image && !content
      errors.add(:image, :content, message: "should have image or text at least")
    end
  end
end
