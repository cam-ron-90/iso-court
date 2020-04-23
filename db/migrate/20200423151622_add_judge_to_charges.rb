class AddJudgeToCharges < ActiveRecord::Migration[6.0]
  def change
    add_reference :charges, :judge, foreign_key: { to_table: :users }, null: false
  end
end
