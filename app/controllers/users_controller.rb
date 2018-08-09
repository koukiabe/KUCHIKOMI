class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :contents, :goods, :likes, :refs, :evas, :nices, :cons]
  before_action :set_user, only: [:edit, :update, :contents, :goods, :likes, :refs, :evas, :nices, :cons]
  
  def show
    @user = User.find(current_user)
    @reviews = @user.reviews.order('created_at DESC').page(params[:page]).per(10)
    @spots = @user.spots.uniq
    counts(@user)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
    
  end

  def update
    if @user.update(user_params)
      flash[:success] = '登録情報を更新しました'
      redirect_to @user
    else
      flash.now[:danger] = '登録情報の更新に失敗しました'
      render :edit
    end
    
  end
  
  def contents
    @reviews = @user.res_reviews.order('created_at DESC').page(params[:page]).per(10)
    @restaurants = @user.restaurants.uniq
    counts(@user)
  end
  
  def goods
    @spot = @user.good_spots
    counts(@user)
  end
  
  def likes
    @spot = @user.like_spots
    counts(@user)
  end
  
  def refs
    @spots = @user.spots.uniq
    @review = @user.ref_reviews.page(params[:page]).per(10)
    counts(@user)
  end
  
  def evas
    @restaurants = @user.restaurants.uniq
    @review = @user.eva_reviews.page(params[:page]).per(10)
    counts(@user)
  end
  
  def nices
    @restaurant = @user.nice_restaurants
    counts(@user)
  end
  
  def cons
    @restaurant = @user.con_restaurants
    counts(@user)
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end