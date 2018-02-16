class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now[:danger] = "There was a problem with your post"
      render 'new'
    end
  end


  private

  def post_params
    params.require(:post).permit(:picture, :caption)
  end

end
