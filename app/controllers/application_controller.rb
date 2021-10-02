class ApplicationController < ActionController::Base 
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:alert] = "Login or sign up to view website." 
      redirect_to root_path
    end
  end

end
