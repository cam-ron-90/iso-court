class CreateCommitments < ActiveRecord::Migration[6.0]
  def change
    create_table :commitments do |t|
      t.string :category
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
