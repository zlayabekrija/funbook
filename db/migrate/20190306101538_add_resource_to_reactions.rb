class AddResourceToReactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :reactions, :resource, polymorphic: true
  end
end
