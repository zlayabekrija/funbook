class Reaction < ApplicationRecord
  belongs_to :resource, polymorphic: true
  belongs_to :user
  # validate :check_reaction

  protected
  def check_reaction
    if like && dislike
      errors.add(:dislike, :like, message: "should be either one of them")
    end
  end
end
