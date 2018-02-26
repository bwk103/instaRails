class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy, :like, :unlike]
  before_action :correct_user, only: [:destroy]

  def index
    logged_in? ? @posts = current_user.feed.paginate(page: params[:page],
                          per_page: 10) :
                 @posts = Post.all.paginate(page: params[:page], per_page: 10)
    @comment = Comment.new
    @users = User.all
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

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted successfully"
    redirect_to posts_path
  end

  def like
    @post = Post.find(params[:id])
    if @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.js
      end
    end
  end

  def unlike
    @post = Post.find(params[:id])
    if @post.unliked_by current_user
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.js
      end
    end
  end


  private

  def post_params
    params.require(:post).permit(:picture, :location, :caption)
  end

  def correct_user
    @user = Post.find(params[:id]).user
    redirect_to root_url unless @user == current_user
  end

end
