require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'uri'
require 'json'
class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @spot = Spot.find(params[:spot_id])
    @review = current_user.reviews.build(review_params)
    @review.spot_id = @spot.id
      if @review.save
        flash[:success] = 'クチコミを投稿しました。'
        redirect_to spot_path(@spot)
      else
        flash.now[:danger] = 'クチコミの投稿に失敗しました。'
        render 'spots/show'
      end
  end

  def destroy
    @review.destroy
    flash[:success] = 'クチコミを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  
  private
  def review_params
    params.require(:review).permit(:title, :review)
  end
  
  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end
  
end
