class Book < ApplicationRecord
  has_many :users, through: :book_users
  has_many :book_users

  with_options presence: true do
    validates :image_url
    validates :title
    validates :author
    validates :url
  end
end
