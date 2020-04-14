class AddGroupToCommitment < ActiveRecord::Migration[6.0]
  def change
    add_reference :commitments, :group, null: false, foreign_key: true
  end
end
