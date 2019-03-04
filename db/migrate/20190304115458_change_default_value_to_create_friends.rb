class ChangeDefaultValueToCreateFriends < ActiveRecord::Migration[5.2]
  def change
      change_column :friends,:friends,:boolean, default: false
  end
end
