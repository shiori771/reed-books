class RemoveUserIdFromBooks < ActiveRecord::Migration[6.0]
  def up
    remove_column :books, :user_id, :integer
  end

  def down
    add_column :books, :user, null: false, foreign_key: true
    add_column :books, :isbn, null: false
  end
end
