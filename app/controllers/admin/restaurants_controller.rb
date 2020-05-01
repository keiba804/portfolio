class Admin::RestaurantsController < ApplicationController
	def top
		@restaurant = current_restaurant
		restaurant_status = @restaurant.restaurant_status
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:restaurant_status)
	end
end
