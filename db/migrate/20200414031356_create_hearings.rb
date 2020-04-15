class CreateHearings < ActiveRecord::Migration[6.0]
  def change
    create_table :hearings do |t|
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
