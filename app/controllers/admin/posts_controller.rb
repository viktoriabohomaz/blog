module Admin
  class PostsController < ApplicationController
    helper PostsHelper
    before_action :authenticate_user!
    before_action :set_post, only: [:edit, :destroy]

    def index
      @posts = Post.order(:created_at).page(params[:page])
    end

    def new
      @post = current_user.posts.new
    end
      
    def edit
    end

    def create
      @post = current_user.posts.new(post_params)
        if @post.save
          redirect_to admin_posts_path, notice: 'Post was successfully created.'
        else
          render :new 
        end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: 'Post was successfully destroyed.'
    end

    private
    def set_post
      @post = Post.friendly.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
  end 
end  
