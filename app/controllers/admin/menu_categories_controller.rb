class Admin::MenuCategoriesController < ApplicationController

	def index
		@menu_category = MenuCategory.new
		@menu_categories = MenuCategory.all
	end

	def create
		@menu_category = MenuCategory.new(genre_params)
	    if @menu_category.save
	    	redirect_to request.referer, notice: "ジャンルを作成しました！"
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
    params.require(:menu_category).permit(:name, :active_status)
  end

end
