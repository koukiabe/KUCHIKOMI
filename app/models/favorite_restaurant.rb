class FavoriteRestaurant < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  
  def self.restaurant_ranking
    self.group(:restaurant_id).order('count_restaurant_id DESC').limit(10).count(:restaurant_id)
  end
  
end
