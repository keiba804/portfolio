class Customer::UserPostImagesController < ApplicationController
  def index
    user = current_user
    @user_post_images = user.user_post_images
  end

  # GET /menus/new
  def new
    @user_post_image = UserPostImage.new
  end

  # GET /menus/1/edit
  def edit
    @user_post_image = UserPostImage.find(params[:id])
  end

  # POST /menus
  # POST /menus.json
  def create
    @user_post_image = UserPostImage.new(user_post_image_params)
    @user_post_image.user_id = current_user.id

	if @user_post_image.save
		format.html { redirect_to @user_post_image, notice: 'Menu was successfully created.' }
		format.json { render :show, status: :created, location: @user_post_image }
	else
		format.html { render :new }
		format.json { render json: @user_post_image.errors, status: :unprocessable_entity }
	end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @user_post_image.update(menu_params)
        format.html { redirect_to @user_post_image, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_post_image }
      else
        format.html { render :edit }
        format.json { render json: @user_post_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @user_post_image.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @user_post_image = UserPostImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:user_post_image).permit(:user_id, :restaurant_id, :user_image_title, :user_post_image_id)
    end
end
