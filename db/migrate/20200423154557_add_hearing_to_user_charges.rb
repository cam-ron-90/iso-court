class AddHearingToUserCharges < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_charges, :hearing, null: false, foreign_key: true
    add_reference :user_charges, :judge, foreign_key: { to_table: :users }, null: false
    add_column :user_charges, :verdict, :string

    remove_reference :charges, :judge, foreign_key: { to_table: :users }
    remove_reference :charges, :hearing, foreign_key: true
    remove_column :charges, :verdict
  end
end
