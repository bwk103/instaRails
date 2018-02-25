class RelationshipsController < ApplicationController

  before_action :logged_in_user, only: [:create]

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow(@user)
    redirect_to @user
  end

end
