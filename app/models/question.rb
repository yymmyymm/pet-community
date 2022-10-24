class Question < ApplicationRecord
  has_one_attached :q_image

  belongs_to :customer
  has_many :question_comments, dependent: :destroy
  has_many :question_favorites, dependent: :destroy

  validates :title, presence: true,length: { minimum: 2, maximum: 100 }
  validates :caption, presence: true,length: { maximum: 200 }

  def favorited_by?(customer)
    question_favorites.exists?(customer_id: customer.id)
  end

  def self.search_for(content)
    Question.where(['title LIKE(?) OR caption LIKE(?)',"%#{content}%","%#{content}%"])
  end

  def get_q_image(width, height)
    unless q_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      q_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    q_image.variant(resize_to_limit: [width, height]).processed
  end
end
