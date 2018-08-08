class Review < ApplicationRecord
  validates :title, length: { maximum: 50 }
  validates :review, presence: true
  
  belongs_to :user
  belongs_to :spot

  has_many :refs, dependent: :destroy
  has_many :ref_users, through: :refs, source: :user
  
end
