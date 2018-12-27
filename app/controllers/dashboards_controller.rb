class DashboardsController < ApplicationController
	before_action :authenticate_user!
	
	def manage_posts
		@posts = Post.order(:created_at).page(params[:page])
	end	

	def manage_users
	end
end
