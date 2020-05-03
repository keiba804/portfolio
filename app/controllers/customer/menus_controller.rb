class Customer::MenusController < ApplicationController
	def index
		@restaurant = Restaurant.find(params[:restaurant_id])
		@menu_categories = @restaurant.menu_categories.where(active_status: 0)
	end


end
