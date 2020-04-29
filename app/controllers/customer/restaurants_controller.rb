class Customer::RestaurantsController < ApplicationController
	def index
		@search = Restaurant.ransack(params[:q])
		@search.build_condition if @search.conditions.empty?
  		@restaurants = @search.result
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
