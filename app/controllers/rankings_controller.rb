class RankingsController < ApplicationController
  
  def good
    @ranking_counts = Good.spot_ranking
    @spots = Spot.find(@ranking_counts.keys)
  end

  def like
    @ranking_counts = Like.spot_ranking
    @spots = Spot.find(@ranking_counts.keys)
  end
  
  def nice
    @ranking_counts = Nice.restaurant_ranking
    @restaurants = Restaurant.find(@ranking_counts.keys)
  end
  
  def con
    @ranking_counts = Con.restaurant_ranking
    @restaurants = Restaurant.find(@ranking_counts.keys)
  end
  
end
