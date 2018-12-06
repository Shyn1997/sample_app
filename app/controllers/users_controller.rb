class UsersController < ApplicationController
  before_action :load_gender, only: %i(new create)
  before_action :find_user, only: %i(show edit update correct_user destroy)
  before_action :logged_in_user, only: %i(index destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def index
    @users = User.page(params[:page]).per Settings.record_page
  end

  def new
    @user = User.new
  end

  def create
    if (@user = User.new user_params).save
      @user.send_activation_email
      flash[:info] = t ".activation"
      redirect_to @user
    else
      flash[:danger] = t ".user_created_fail"
      render :new
    end
  end

  def show
    @follow = current_user.active_relationships.build
    @unfollow = current_user.active_relationships.find_by followed_id: @user.id
    @microposts = @user.microposts.page(params[:page]).per Settings.record_page
    return if @user
    redirect_to root_url
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t ".profile_update"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t ".delete"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :gender
  end

  def find_user
    @user = User.find_by id: params[:id]
    flash[:danger] = t ".user_danger" unless @user
  end

  def load_gender
    @gender = User.genders.keys
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t ".please_log"
    redirect_to login_url
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
