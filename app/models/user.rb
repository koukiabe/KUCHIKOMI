class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  mount_uploader :image, ImageUploader
  
  has_many :reviews
  has_many :spots, through: :reviews
  
  has_many :favorite_spots
  has_many :spots, through: :favorite_spots
  has_many :goods
  has_many :good_spots, through: :goods, class_name: 'Spot', source: :spot
  
  def good(spot)
    self.goods.find_or_create_by(spot_id: spot.id)
  end

  def ungood(spot)
    good = self.goods.find_by(spot_id: spot.id)
    good.destroy if good
  end

  def good?(spot)
    self.good_spots.include?(spot)
  end
  
end
