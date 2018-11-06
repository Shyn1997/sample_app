class PasswordResetsController < ApplicationController
  before_action :find_email_user, :valid_user, :check_expiration, only: %i(edit update)

  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t ".mail_reset"
      redirect_to root_url
    else
      flash.now[:danger] = t ".mail_reset_fail"
      render :new
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty?
      @user.errors.add :password, t(".cant_empty")
      render :edit
    elsif @user.update_attributes user_params
      log_in @user
      flash[:success] = t ".success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  def check_expiration
    return unless @user.password_reset_expired?
    flash[:danger] = t ".fail"
    redirect_to new_password_reset_url
  end

  def find_email_user
    @user = User.find_by email: params[:email]
    flash[:danger] = t ".fail_email" unless @user
  end

  def valid_user
    return if @user&.activated? &&
           @user.authenticated?(:reset, params[:id])
    redirect_to root_url
  end
end
