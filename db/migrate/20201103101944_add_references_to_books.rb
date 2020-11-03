class AddReferencesToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :user, null: false, foreign_key: { to_table: :users }
  end
end
