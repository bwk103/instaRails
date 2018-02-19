module PostsHelper

  def is_author?(post_id)
    current_user == Post.find(post_id).user
  end
end
