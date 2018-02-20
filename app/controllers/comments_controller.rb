class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]

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
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
