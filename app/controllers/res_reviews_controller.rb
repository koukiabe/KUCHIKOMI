class ResReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = current_user.res_reviews.build(review_params)
    @review.restaurant_id = @restaurant.id
      if @review.save
        flash[:success] = 'クチコミを投稿しました。'
        redirect_to restaurant_path(@restaurant)
      else
        flash.now[:danger] = 'クチコミの投稿に失敗しました。'
        render 'restaurants/show'
      end
        
  end

  def destroy
    @review.destroy
    flash[:success] = 'クチコミを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  
  private
  
  def review_params
    params.require(:res_review).permit(:title, :review)
  end
  
  def correct_user
    @review = current_user.res_reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end
  
end
