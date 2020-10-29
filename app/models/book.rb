class Book < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :image_url
    validates :title
    validates :url
  end

  validates :user_id,  uniqueness: { scope: :title } 

end
