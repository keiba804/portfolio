class Admin::MenusController < ApplicationController
    before_action :authenticate_restaurant!
  # before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @restaurant = current_restaurant
    @menu_categories = @restaurant.menu_categories.where(active_status: 0)
  end

  # GET /menus/new
  def new
    if current_restaurant.menu_categories.present?
      @menu = Menu.new
    else
      redirect_to admin_menu_categories_path, notice: '【！】メニューカテゴリーを作成してください'
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)
    @menu.restaurant_id = current_restaurant.id

    respond_to do |format|
      if @menu.save
        format.html { redirect_to admin_menus_path, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    @menu = Menu.find(params[:id])
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to admin_menus_path, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to admin_menus_path, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:menu_category_id,:price, :menu_name, :explanation, :takeout, :sales_status, :restaurant_id)
    end
end
