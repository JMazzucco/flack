class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate
  helper_method :logged_in?, :current_user


  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:id])
  end

  def authenticate
    redirect_to root_path unless logged_in?
  end

  def log_in(user)
    session[:id] = user.id
  end
end
