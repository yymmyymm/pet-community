class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :question_comments, dependent: :destroy
  has_many :question_favorites, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :customer_rooms
  has_many :chats
  has_many :rooms, through: :customer_rooms
  has_many :view_counts, dependent: :destroy
  has_many :group_members, dependent: :destroy

  #フォロー、フォロワー関連
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_one_attached :profile_image

  validates :name, length: { maximum: 20 }, uniqueness: true
  validates :name_kana, length: { maximum: 20 }, uniqueness: true
  validates :pen_name, length: { maximum: 20 }, uniqueness: true
  validates :pet_name, length: { maximum: 20 }, uniqueness: true
  validates :introduce, length: { maximum: 200 }

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

  def self.search_for(content)
     Customer.where(['pen_name LIKE(?) OR pet_name LIKE(?) OR introduce LIKE(?)',"%#{content}%","%#{content}%" ,"%#{content}%"])
  end

  #ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guestuser',email: 'guest@example.com',name_kana: 'guestuser_kana',pen_name: 'pen_guestuser') do |customer|
      customer.name = 'guestuser'
      customer.email = 'guest@example.com'
      customer.name_kana = 'guestuser_kana'
      customer.pen_name = 'pen_guestuser'
      customer.password = SecureRandom.urlsafe_base64
    end
  end


end
