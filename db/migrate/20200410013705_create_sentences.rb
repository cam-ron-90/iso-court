class CreateSentences < ActiveRecord::Migration[6.0]
  def change
    create_table :sentences do |t|
      t.string :description
      t.references :charge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
