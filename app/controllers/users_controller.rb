class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :set_user, only: [:edit, :update]
  
  def show
    @user = User.find(current_user)
    @reviews = @user.reviews.order('created_at DESC').page(params[:page]).per(10)
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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end