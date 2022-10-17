class Question < ApplicationRecord
  has_one_attached :q_image

  belongs_to :customer
  has_many :question_comments, dependent: :destroy

  def get_q_image(width, height)
    unless q_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      q_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    q_image.variant(resize_to_limit: [width, height]).processed
  end
end
