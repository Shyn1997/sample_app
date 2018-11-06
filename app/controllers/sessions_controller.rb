class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate(params[:session][:password])
      log_in user
      remember user
      remember_login user
      redirect_back_or user
    else
      flash[:danger] = t "controller.invalid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def remember_login user
    if params[:session][:remember_me] == Settings.session_value
      remember user
    else
      forget user
    end
  end
end
