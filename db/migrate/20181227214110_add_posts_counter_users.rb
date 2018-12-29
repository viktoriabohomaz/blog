# frozen_string_literal: true

class AddPostsCounterUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :posts_count, :integer, default: 0
  end
end
