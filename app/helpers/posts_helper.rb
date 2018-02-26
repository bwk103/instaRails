module PostsHelper
  def is_author?(post_id)
    current_user == Post.find(post_id).user
  end

  def liked_by(post)
    votes = post.votes_for.up.by_type(User)
    pluralize(votes.count, "like")
  end

  def liked_post(post)
    current_user.voted_for? post
  end
end
