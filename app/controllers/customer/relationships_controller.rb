class Customer::RelationshipsController < ApplicationController
	before_action :authenticate_user!
	def follow
		current_user.follow(params[:id])
		redirect_back(fallback_location: customer_follow_path)
	end

	def unfollow
		current_user.unfollow(params[:id])
		redirect_back(fallback_location: customer_unfollow_path)
	end
	def follower_index
		@restaurant = Restaurant.find(params[:id])
	end
	def following_index
		@user = User.find(params[:id])
	end
	private
	def restaurant_params
		params.require(:restaurant).permit(:restaurant_name, :genre, :restaurant_phone_number, :restaurant_adress, :access, :regular_holiday, :charge, :payment, :introduce_title,:introduce_body,:restaurant_top_image_id)
	end
end
