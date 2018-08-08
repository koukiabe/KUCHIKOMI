class Restaurant < ApplicationRecord
  validates :place_id, presence: true, length: { maximum: 255 }
  validates :formatted_address, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :photo_reference, presence: true
  
  has_one :restaurant_photo
  
  has_many :favorite_restaurants
  has_many :users, through: :favorite_restaurants
  has_many :nices, class_name: 'Nice'
  has_many :nice_users, through: :nices, class_name: 'User', source: :user
  has_many :cons
  has_many :con_users, through: :cons, class_name: 'User', source: :user
  
  has_many :res_reviews
  has_many :users, through: :res_reviews
  
end
