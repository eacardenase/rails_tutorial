class ApplicationController < ActionController::Base
  before_action  :authenticate_user!, :user_has_profile?
  helper_method :current_user

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def authenticate_user!
    redirect_to login_path, notice: "You have to be logged in." unless current_user
  end

  def user_has_profile?
    redirect_to new_profile_path, notice: "Tell us more about you" if current_user && current_user.profile.nil?
  end
end
