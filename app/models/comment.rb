class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :reactions, dependent: :destroy

  validates :content, length: {maximum: 120}, presence: true
end
