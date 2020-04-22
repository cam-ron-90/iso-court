class AddAdminToGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :admin, foreign_key: { to_table: :users }, null: false
  end
end
