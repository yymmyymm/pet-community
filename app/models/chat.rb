class Chat < ApplicationRecord
  belongs_to :customer
  belongs_to :room

  validates :message, presence: true, length: { maximum: 140 }
end
