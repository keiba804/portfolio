class Customer::RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end
	def show
		@restaurant = Restaurant.find(params[:id])
		@restaurant_images = @restaurant.restaurant_images
		@user_post_images = @restaurant.user_post_images
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:restaurant_name, :genre, :restaurant_phone_number, :restaurant_adress, :access, :regular_holiday, :charge, :payment, :introduce_title,:introduce_body,:restaurant_top_image_id)
	end
end
