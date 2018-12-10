class ApplicationController < ActionController::Base
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  protect_from_forgery

  protected

  def authenticate_user
    unless session[:user_id]
        redirect_to(:controller => 'main', :action => 'login')
        return false
    else
      # set current_user by the current user object
      @current_user = User.find session[:user_id] 
      return true
    end
  end
end
