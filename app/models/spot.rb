class Spot < ApplicationRecord
  validates :place_id, presence: true, length: { maximum: 255 }
  validates :formatted_address, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :photo_reference, presence: true
  
  has_one :spot_weekday
  
  has_one :spot_photo
  
  has_many :reviews
  has_many :users, through: :reviews
  
  has_many :favorite_spots
  has_many :users, through: :favorite_spots
  has_many :goods
  has_many :good_users, through: :goods, class_name: 'User', source: :user
  has_many :likes
  has_many :like_users, through: :likes, class_name: 'User', source: :user
  
end
