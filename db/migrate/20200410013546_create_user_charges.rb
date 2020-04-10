class CreateUserCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_charges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :charge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
