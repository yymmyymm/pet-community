class Contact < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 300 }
end
