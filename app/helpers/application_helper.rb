module ApplicationHelper
  def display_time(time)
    time.to_formatted_s(:short)
  end

  def logged_in_user_id
    session[:user_id]
  end

  def logged_in_user_name
    session[:user_name]
  end
end
