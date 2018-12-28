# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show update]

  def index
    @posts = Post.order(:created_at).page(params[:page])
  end

  def show
    @post.punch(request)
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
