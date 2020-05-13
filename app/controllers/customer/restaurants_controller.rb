class Customer::RestaurantsController < ApplicationController
	before_action :authenticate_user!
	def index
		if params[:q] != nil
			@key_words = params[:q]['genre_or_introduce_title_or_introduce_body_or_restaurant_name_or_restaurant_adress_or_access_cont'].split(/[\p{blank}\s]+/) 
			grouping_hash = @key_words.reduce({}){|hash, word| hash.merge(word => { genre_or_introduce_title_or_introduce_body_or_restaurant_name_or_restaurant_adress_or_access_cont: word })}
			@search = Restaurant.ransack({ combinator: 'and', groupings: grouping_hash })
			@restaurants = @search.result
		
			# params[:q]['genre_or_introduce_title_or_introduce_body_or_restaurant_name_or_restaurant_adress_or_access_cont_any'] = params[:q]['genre_or_introduce_title_or_introduce_body_or_restaurant_name_or_restaurant_adress_or_access_cont_any'].split(/[\p{blank}\s]+/)
			# @search = Restaurant.ransack(params[:q])
			# @restaurants = @search.result
		else
			@search = Restaurant.ransack(params[:q])
			@restaurants = @search.result
		end  		
	end
	def show
		@restaurant = Restaurant.find(params[:id])
		@map_address = @restaurant.restaurant_adress
		@restaurant_images = @restaurant.restaurant_images.limit(4)
		@user_post_images = @restaurant.user_post_images.limit(4)
	end
	def post
		@restaurant = Restaurant.find(params[:restaurant_id])
		@posts = @restaurant.posts.order(created_at: :desc)
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:restaurant_name, :genre, :restaurant_phone_number, :restaurant_adress, :access, :regular_holiday, :charge, :payment, :introduce_title,:introduce_body,:restaurant_top_image_id)
	end
end
