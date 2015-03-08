class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Devise::Controllers::Helpers

  helper_method :current_user

  private

  def current_user
    return unless session[:session_token]
    @current_user ||= User.find(session[:session_token])
  end
end
