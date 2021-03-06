class Admin::RestaurantsController < ApplicationController
		before_action :authenticate_restaurant!
	def top
		@posts = current_restaurant.posts.order(created_at: :desc).first(5)
	end
	def show
		@restaurant = Restaurant.find(params[:id])
		@map_address = @restaurant.restaurant_adress
	end
	def edit
		@restaurant = Restaurant.find(params[:id])
	end
	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update(restaurant_params)
    		redirect_to admin_restaurant_top_path,notice: "空席情報を更新しました！"
	    else
	    	render :edit
	    end
	end
	private
    def restaurant_params
		params.require(:restaurant).permit(:restaurant_status,:restaurant_id)
	end
end
