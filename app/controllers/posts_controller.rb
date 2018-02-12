class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(user_params)
    if @post.save
      p 'Yay, you made a post!'
    else
      redirect root_path
    end
  end


  private

  def user_params
    params.require(:post).permit(:picture, :caption)
  end
end
