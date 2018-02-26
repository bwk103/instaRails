class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @post = Post.find(params[:comment][:post_id])
    if @comment.save
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    else
      flash[:danger] = "There was a problem submitting your comment"
      redirect_to posts_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end

    def correct_user
      comment = Comment.find(params[:id])
      redirect_to posts_url unless comment.user == current_user
    end
end
