class Customer::UsersController < ApplicationController
	before_action :authenticate_user!
	def top
		@restaurants = Restaurant.where(restaurant_status: 2)
	end
	def show
	end
end
