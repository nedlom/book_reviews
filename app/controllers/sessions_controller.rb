class SessionsController < ApplicationController

  def welcome
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def new
  end

  def create
    if params[:provider] == 'github'
      @user = User.create_by_github_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else

      @user = User.find_by(email: params[:user][:email])
 
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:alert] = "Login failed. Email or password incorrect. Please try again"
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private
  
  def auth
    request.env['omniauth.auth']
  end

end