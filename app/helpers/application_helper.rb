module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def go_here
    binding.pry 
  end
end
