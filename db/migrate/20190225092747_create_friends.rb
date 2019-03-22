class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.boolean :friends
      t.references :user, foreign_key: true
      t.integer :friend_uid

      t.timestamps
    end
  end
end
