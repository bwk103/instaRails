class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Welcome back to instaRails, #{@user.name}"
      log_in(@user)
      redirect_to @user
    else
      flash.now[:danger] = "Invalid username / password"
      render "new"
    end
  end

  def destroy
    log_out
    flash[:success] = "You have been logged out"
    redirect_to root_url
  end
end
