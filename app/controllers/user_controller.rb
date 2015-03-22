class UserController < ApplicationController

  skip_before_action :logged_in_user, only: [:register, :log_in]

  def member

  end

  def register
    @user = User.new(user_params)

    if @user.save!
      start_session_with_user @user
      redirect_to home_dashboard_path
    else

    end
  end

  def log_in
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])

    if @user
      start_session_with_user @user
      redirect_to home_dashboard_path
    else

    end
  end

  def log_out
    reset_session
    redirect_to home_welcome_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :cell_number)
  end
end
