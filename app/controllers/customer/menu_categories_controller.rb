class Customer::MenuCategoriesController < ApplicationController
	def index
		restaurant = Restaurant.find(params[:restaurant_id])
		@menu_categories = restaurant.menucategory
	end
end
