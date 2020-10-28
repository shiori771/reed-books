class CreateBookUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :book_users do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.timestamps
    end
  end
end
