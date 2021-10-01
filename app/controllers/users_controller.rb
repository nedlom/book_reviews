class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new, alert: "alert message"
    end
  end

  def show
    @user = User.find_by(id: params[:id])

    # prevent error screen for no user
    if @user.nil?
      redirect_to :root
    end
    
  end

  private 

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
