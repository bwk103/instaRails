class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to posts_path
    else
      flash[:danger] = 'There was a problem submitting your comment'
      redirect_to posts_path
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to posts_path
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
