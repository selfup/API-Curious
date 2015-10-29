class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :visitor

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def visitor
    if current_user.nil?
      flash[:error] = "You have not logged in!"
      redirect_to root_path
    end
  end
end
