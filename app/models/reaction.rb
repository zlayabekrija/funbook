class Reaction < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user
  belongs_to :comment, optional: true
  validate :check_reaction

  protected
  def check_reaction
    if like && dislike
      errors.add(:dislike, :like, message: "should be either one of them")
    end
  end
end
