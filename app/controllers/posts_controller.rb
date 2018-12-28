class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]

  def index
    @posts = Post.order(:created_at).page(params[:page])
  end

  def show
    @post.punch(request)
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end  
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
