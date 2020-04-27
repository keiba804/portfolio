class Admin::RestaurantImagesController < ApplicationController
	def index
		@restaurant_images = restaurant.restaurant_images
	end
	def new
		@restaurant_image = RestaurantImages.new
	end

	def create
		@restaurant_image = RestaurantImages.new(genre_params)
	    if @restaurant_image.save
	    	redirect_to admin_restaurant_images_path, notice: "店舗写真を追加しました！"
	    else
	    	@restaurant_image = RestaurantImages.all
	    	render :new
    	end
	end

	def edit
		@restaurant_image = RestaurantImages.find(params[:id])
	end

	def update
		@restaurant_image = RestaurantImages.find(params[:id])
	    if @restaurant_image.update(menu_category_params)
	      redirect_to admin_restaurant_images_path, notice: "店舗写真を編集しました！"
	    else
	      render :edit
	    end
	end

	def destroy
	end

	private

  def menu_category_params
    params.require(:menu_category).permit(:name, :active_status)
  end
end
