class UsersController < ApplicationController
  before_action :load_gender, only: %i(new create)

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    
    if @user.save
      flash[:success] = t "user1.user_created"
      redirect_to @user
    else
      flash[:danger] = t "user1.user_created_fail"
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t "user1.user_danger"
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :gender
  end

  def load_gender
    @gender = User.genders.keys
  end
end
