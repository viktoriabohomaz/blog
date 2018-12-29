# frozen_string_literal: true

module Admin
  class PostsController < ApplicationController
    helper PostsHelper
    before_action :authenticate_user!
    before_action :set_post, only: %i[edit destroy update]

    def index
      @posts = policy_scope(Post).page(params[:page])
    end

    def new
      @post = current_user.posts.new
      authorize @post
    end

    def edit; end

    def create
      @post = current_user.posts.new(post_params)
      authorize @post
      if @post.save
        redirect_to post_path(@post), notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    def update
      if @post.update(post_params)
        redirect_to post_path(@post), notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: 'Post was successfully destroyed.'
    end

    private

    def set_post
      @post = Post.friendly.find(params[:id])
      authorize @post
    end

    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
  end
end
