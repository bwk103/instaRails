class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :destroy]
  before_action :correct_user, only: [:edit, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to instaRails"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      redirect_to @user
    else
      render 'users/edit'
    end
  end

  def destroy
    current_user.destroy
    flash[:danger] = "User successfully deleted"
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :bio, :email, :profile, :password,
                                 :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end


end
