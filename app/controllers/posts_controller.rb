class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(user_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    else
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:post).permit(:picture, :caption)
  end
end
