class RemoveChargeFromSentences < ActiveRecord::Migration[6.0]
  def change
    add_reference :sentences, :user_charge, null: false, foreign_key: true
  end
end


