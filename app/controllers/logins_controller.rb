class LoginsController < ApplicationController
  def create
    #
    session[:current_user_id] = user.id
    flash[:success] = "You're logged in!"
    redirect_to root_url
  end

  def destroy
    session.delete(:current_user_id)
    flash[:notice] = "You have successfully logged out."
    @_current_user = nil
    redirect_to root_url
  end
end
