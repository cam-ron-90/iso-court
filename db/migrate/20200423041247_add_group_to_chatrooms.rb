class AddGroupToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :group, null: false, foreign_key: true
  end
end
