# frozen_string_literal: true

module PostsHelper
  def author(post:)
    User.find_by(id: post.user_id).email
  end

  def get_random_posts_for_page
    @posts = Post.all.sample(3)
  end
end
