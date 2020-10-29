class Book < ApplicationRecord
  belongs_to :user

  with_options presence: true, uniqueness: true do
    validates :image_url
    validates :title
    validates :url
  end
end
