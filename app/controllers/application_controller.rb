class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authentication


  def if_logged_in
    unless @current_user
      redirect_to new_session_path
    end
  end

  def authentication
    @current_user = User.find(session[:user_id]) if session[:user_id].present?
  end
end