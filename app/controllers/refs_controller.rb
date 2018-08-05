class RefsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    review = Review.find(params[:review_id])
    current_user.ref(review)
    flash[:success] = '参考になった！に登録しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    review = Review.find(params[:review_id])
    current_user.unref(review)
    flash[:danger] = '参考になった！を解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
