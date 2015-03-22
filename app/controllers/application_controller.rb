class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :logged_in_user

  def start_session_with_user(user)
    @user = user
    reset_session
    session[:user_name] = user.name
    session[:user_id] = user.id
  end

  def logged_in_user_id
    session[:user_id]
  end

  def logged_in_user
    @user = User.find_by_id(session[:user_id])
    redirect_to home_welcome_url unless @user
    @user
  end
end
