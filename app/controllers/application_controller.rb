class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login?
    !!current_user
  end

  def require_user
    redirect_to root_url unless current_user
  end

  def authorized?(id)
    current_user.id == id
  end
end
