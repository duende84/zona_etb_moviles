class AddCodeIdToUsers < ActiveRecord::Migration
  def change
    add_column(:users, :code_id, :integer, null: false)
    add_foreign_key(:users, :codes)
  end
end
