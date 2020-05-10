class Admin::MenuCategoriesController < ApplicationController
	before_action :authenticate_restaurant!

	def index
		@menu_category = MenuCategory.new
		@menu_categories = current_restaurant.menu_categories
		puts @menu_categories[0]
	end

	def create
		@menu_category = MenuCategory.new(menu_category_params)
		@menu_category.restaurant_id = current_restaurant.id
	    if @menu_category.save
	    	redirect_to admin_menu_categories_path, notice: "ジャンルを作成しました！"
	    else
	    	@menu_categories = MenuCategory.all
	    	render :index
    	end
	end

	def edit
		@menu_category = MenuCategory.find(params[:id])
	end

	def update
		@menu_category = MenuCategory.find(params[:id])
	    if @menu_category.update(menu_category_params)
	      redirect_to admin_menu_categories_path, notice: "ジャンルを編集しました！"
	    else
	      render :edit
	    end
	end

	def destroy
	end

	private

  def menu_category_params
    params.require(:menu_category).permit(:menu_category_name, :active_status)
  end

end
