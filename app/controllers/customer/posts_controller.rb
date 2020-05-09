class Customer::PostsController < ApplicationController
	def index
		@restaurants = current_user.following_user
		@posts = []
		if @restaurants.present?
			@restaurants.each do |restaurant|
				restaurant.posts = Post.where(restaurant_id: restaurant.id).order(created_at: :desc)
				@posts.concat(restaurant.posts)
			end
			@posts.sort_by{|post| post.created_at}
			if @posts.nil?
				flash[:notice]="まだ投稿がありません…"
			end
		else
			flash[:notice]="誰かをフォローしてみましょう！"
			redirect_to customer_user_top_path
		end
	end
	def show
		@post = Post.find(params[:id])
	end
end
