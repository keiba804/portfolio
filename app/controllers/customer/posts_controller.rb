class Customer::PostsController < ApplicationController
	def index
		@restaurants = current_user.following_user
		if @restaurants.present?
			@restaurants.each do |restaurant|
				@posts = Post.where(restaurant_id: restaurant.id).order(created_at: :desc)
			end
			@posts.sort_by{|post| post.created_at}
			if @posts.nil?
				flash[:notice]="まだ投稿がありません…"
				redirect_to("/")
			end
		else
			flash[:notice]="誰かをフォローしてみましょう！"
			redirect_to("/")
		end
	end
	def show
		@post = Post.find(params[:id])
	end
end