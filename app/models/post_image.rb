class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags
  belongs_to :genre

  validates :title, presence: true
  validates :image, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.search(search_word)
    PostImage.where(['category LIKE ?', "#{search_word}"])
  end

  def self.search_for(content, method)
    if method == "perfect"
      PostImage.where(title: content)
    elsif method == "forward"
      PostImage.where("title LIKE ?", content + "%")
    elsif method == "backward"
      PostImage.where("title LIKE ?", "%" + content)
    else
      PostImage.where("title LIKE ?", "%" + content + "%")
    end
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    old_tags.each do |name|
      self.tags.delete　Tag.find_by(name: old)
    end
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
   end
  end

end
