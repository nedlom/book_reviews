class SessionsController < ApplicationController

  def welcome
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      binding.pry
      # add flash
      redirect_to login_path, alert: "Login info incorrect. Please try again"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  def omniauth
  end

end