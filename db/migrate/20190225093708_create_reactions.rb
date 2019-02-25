class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.boolean :like
      t.boolean :dislike

      t.timestamps
    end
  end
end
