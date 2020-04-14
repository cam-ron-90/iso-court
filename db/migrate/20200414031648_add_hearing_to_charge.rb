class AddHearingToCharge < ActiveRecord::Migration[6.0]
  def change
    add_reference :charges, :hearing, null: false, foreign_key: true
  end
end
