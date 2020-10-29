class Book < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :image_url
    validates :title
    validates :author
    validates :url
  end
end
