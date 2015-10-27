class SessionsController < ApplicationController
  def create
    byebug
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def show_me
    render text: request.env["omniauth.auth"].inspect
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
