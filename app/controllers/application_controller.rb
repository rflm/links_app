class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception

  def logged_in_user
    return false if logged_in?
    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
