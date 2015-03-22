class HomeController < ApplicationController

  skip_before_action :logged_in_user, only: :welcome

  def welcome
    redirect_to home_dashboard_path if logged_in_user_id
  end

  def dashboard
    @barks_from_me = Bark.from_user(@user)
    @barks_to_me = Bark.to_user(@user)
    @barks_public_noise = Bark.public_noise
  end

  private

  def verify_log_in_status
    unless session[:user_id] && User.find_by_id(session[:user_id])
      reset_session
      redirect_to home_welcome_path
    end
  end

  def delete_puppy
    @user = User.find_by_id(session[:user_id])
  end
end
