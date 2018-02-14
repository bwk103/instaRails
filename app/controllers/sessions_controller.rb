class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      redirect_to @user
      # And show flash message
    else
      render 'new'
      # And show flash message with errors
    end
  end

end
