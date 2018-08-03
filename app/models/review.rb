class Review < ApplicationRecord
  validates :title, length: { maximum: 50 }
  validates :review, presence: true
  
  belongs_to :user
  belongs_to :spot
end
