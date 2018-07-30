class Spot < ApplicationRecord
  validates :place_id, presence: true, length: { maximum: 255 }
  validates :formatted_address, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :photo_reference, presence: true
  
  has_one :spot_weekdays
  
  has_one :spot_photos
end
