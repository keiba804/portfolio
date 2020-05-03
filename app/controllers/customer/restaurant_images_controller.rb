class Customer::RestaurantImagesController < ApplicationController
	def index
		@restaurant = Restaurant.find([:restaurant_id])
		@restaurant_images = @restaurant.restaurant_images
		@user_post_images= @restaurant.user_post_images
	end
	def new
		@restaurant_image = RestaurantImage.new
	end

	def create
		@restaurant_image = RestaurantImage.new(restaurant_image_params)
		@restaurant_image.restaurant_id = current_restaurant.id
	    if @restaurant_image.save
	    	redirect_to admin_restaurant_images_path, notice: "店舗写真を追加しました！"
	    else
	    	render :new
    	end
	end

	def edit
		@restaurant_image = RestaurantImage.find(params[:id])
	end

	def update
		@restaurant_image = RestaurantImage.find(params[:id])
	    if @restaurant_image.update(menu_category_params)
	      redirect_to admin_restaurant_images_path, notice: "店舗写真を編集しました！"
	    else
	      render :edit
	    end
	end

	def destroy
	end

	private

	def restaurant_image_params
	params.require(:restaurant_image).permit(:restaurant_image_title, :restaurant_image_body, :restaurant_image, :restaurant_id)
	end
end
