class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.text :image_url,         null: false
      t.string :title,           null: false
      t.string :author,          null: false
      t.text :url,               null: false
      t.timestamps
    end
  end
end
