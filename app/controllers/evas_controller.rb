class EvasController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    review = ResReview.find(params[:review_id])
    current_user.eva(review)
    flash[:success] = '参考になった！に登録しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    review = ResReview.find(params[:review_id])
    current_user.uneva(review)
    flash[:danger] = '参考になった！を解除しました。'
    redirect_back(fallback_location: root_url)
  end
  
end
