module CommentsHelper
  def comment_author?(comment_id)
    current_user == Comment.find(comment_id).user
  end
end
