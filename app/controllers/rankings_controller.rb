class RankingsController < ApplicationController
  
  def good
    @ranking_counts = Good.ranking
    @spots = Spot.find(@ranking_counts.keys)

    
  end

  def like
    @ranking_counts = Like.ranking
    @spots = Spot.find(@ranking_counts.keys)
  end
  
end
