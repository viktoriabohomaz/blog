# frozen_string_literal: true

module PostsHelper
  def author(post:)
    User.find_by(id: post.user_id).email
  end
end
