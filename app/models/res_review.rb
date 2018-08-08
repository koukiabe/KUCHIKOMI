class ResReview < ApplicationRecord
  validates :title, length: { maximum: 50 }
  validates :review, presence: true
  
  belongs_to :user
  belongs_to :restaurant
  
  has_many :evas, dependent: :destroy
  has_many :eva_users, through: :evas, source: :user
  
end
