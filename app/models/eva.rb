class Eva < ApplicationRecord
  belongs_to :user
  belongs_to :res_review
  
  validates :user_id, presence: true
  validates :res_review_id, presence: true
end
