class AddHearingToCommitment < ActiveRecord::Migration[6.0]
  def change
    add_reference :commitments, :hearing, null: false, foreign_key: true
  end
end
