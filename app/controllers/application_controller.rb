class ApplicationController < ActionController::Base

  include SessionsHelper

  helper_method :current_user
  helper_method :logged_in?

  private

  def authenticate_user!
    cookies[:request_url] = request.original_url
    unless current_user
      redirect_to login_path
    end

    cookies[:email] = current_user&.email
  end

  def current_user
   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end 

end
