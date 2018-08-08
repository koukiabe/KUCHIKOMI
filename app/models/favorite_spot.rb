class FavoriteSpot < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  
  def self.spot_ranking
    self.group(:spot_id).order('count_spot_id DESC').limit(10).count(:spot_id)
  end
  
end
