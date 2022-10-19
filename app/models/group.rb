class Group < ApplicationRecord
  has_one_attached :group_image
  belongs_to :owner, class_name: 'Customer'
  has_many :group_members, dependent: :destroy

  has_many :customers, through: :group_members, source: :customer

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 120 }

  def get_group_image(width, height)
    unless group_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      group_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    group_image.variant(resize_to_limit: [width, height]).processed
  end

  def is_owned_by?(customer)
    owner.id == customer.id
  end

  def includesUser?(customer)
    group_members.exists?(customer_id: customer.id)
  end
end
