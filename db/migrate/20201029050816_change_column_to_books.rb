class ChangeColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :author, true
  end
end
