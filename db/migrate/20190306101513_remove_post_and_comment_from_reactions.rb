class RemovePostAndCommentFromReactions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reactions, :post, foreign_key: true
    remove_reference :reactions, :comment, foreign_key: true
  end
end
