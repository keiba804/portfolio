class Customer::MenuCategoriesController < ApplicationController
	before_action :authenticate_user!
	def index
		restaurant = Restaurant.find(params[:restaurant_id])
		@menu_categories = restaurant.menucategory
	end
end
