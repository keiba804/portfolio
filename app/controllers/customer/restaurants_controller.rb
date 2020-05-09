class Customer::RestaurantsController < ApplicationController
	def index
		if params[:q] != nil
			params[:q]['introduce_title_or_introduce_body_or_restaurant_name_or_restaurant_adress_or_access_cont_all'] = params[:q]['introduce_title_or_introduce_body_or_restaurant_name_or_restaurant_adress_or_access_cont_all'].split(/[\p{blank}\s]+/)
			@search = Restaurant.ransack(params[:q])
			@restaurants = @search.result
		else
			@search = Restaurant.ransack(params[:q])
			@restaurants = @search.result
		end  		
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
