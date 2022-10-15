class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :customer_rooms
  has_many :chats
  has_many :rooms, through: :customer_rooms
  has_many :view_counts, dependent: :destroy
  has_many :group_members, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :name_kana, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :pen_name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :pet_name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def follow(customer)
    relationships.create(followed_id: customer.id)
  end

  def unfollow(customer)
    relationships.find_by(followed_id: customer.id).destroy
  end

  def following?(customer)
    followings.include?(customer)
  end

  def self.search_for(content, method)
    if method == "perfect"
      Customer.where(name: content)
    elsif method == "forward"
      Customer.where("name LIKE ?", content + "%")
    elsif method == "backward"
      Customer.where("name LIKE ?", "%" + content)
    else
      Customer.where("name LIKE ?", "%" + content + "%")
    end
  end
end
