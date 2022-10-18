class QuestionFavorite < ApplicationRecord

  belongs_to :customer
  belongs_to :question
end
