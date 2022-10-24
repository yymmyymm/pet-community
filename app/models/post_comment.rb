class PostComment < ApplicationRecord

  belongs_to :customer
  belongs_to :post_image

  validates :comment, presence: true, length: { maximum: 200 }
end
