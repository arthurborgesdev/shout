class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  private 

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this page"
      redirect_to welcome_url
    end
  end
end
