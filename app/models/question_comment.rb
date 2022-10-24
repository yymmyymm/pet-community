class QuestionComment < ApplicationRecord

  belongs_to :customer
  belongs_to :question

  validates :comment, presence: true, length: { maximum: 200 }
end
