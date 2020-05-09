class Customer::UserPostImagesController < ApplicationController
  def index
    user = current_user
    @user_post_images = user.user_post_images
  end

  def new
    @user_post_image = UserPostImage.new
  end

  def edit
    @user_post_image = UserPostImage.find(params[:id])
  end

  def create
    @user_post_image = UserPostImage.new(user_post_image_params)
    @user_post_image.user_id = current_user.id
    restaurant = Restaurant.find(params[:restaurant_id])
    @user_post_image.restaurant_id = restaurant.id
	if @user_post_image.save
    	redirect_to customer_restaurant_restaurant_images_path(restaurant), notice: "店舗写真を追加しました！"
    else
    	render :new
	end
  end

  def update
    respond_to do |format|
      if @user_post_image.update(menu_params)
      end
    end
  end

  def destroy
    @user_post_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_post_image
      @user_post_image = UserPostImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_post_image_params
      params.require(:user_post_image).permit(:user_id, :restaurant_id, :user_image_title, :user_post_image_id)
    end
end
