class Admin::RestaurantsController < ApplicationController
	def top
	end
	def update
		@restaurant = Restaurant.find(params[:id])
	    @menu_category.update(menu_category_params)
	    redirect_to admin_restaurant_top_path, notice: "空席情報を更新しました！"
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:restaurant_status)
	end
end
