class AddCommitmentToUserCommitment < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_commitments, :commitment, null: false, foreign_key: true
  end
end
