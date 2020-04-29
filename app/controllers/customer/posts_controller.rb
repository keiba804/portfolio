class Customer::PostsController < ApplicationController
	def index
		@restaurants = current_user.following_user
		@posts = []
		if @users.present?
			@users.each do |user|
				posts = Post.where(user_id: user.id).order(created_at: :desc)
				#取得したユーザーの投稿一覧を@postsに格納
				@posts.concat(posts)
			end
			@posts.sort_by!{|post| post.created_at}
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
	end
end
