class AddVerdictToCharge < ActiveRecord::Migration[6.0]
  def change
    add_column :charges, :verdict, :string
  end
end
