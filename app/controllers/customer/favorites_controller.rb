class Customer::FavoritesController < ApplicationController
    before_action :authenticate_user!
    before_action :menu_params
	def create
        menu = Menu.find(params[:menu_id])
        @id_name = "#favorite-link-#{menu.id}"
        favorite = current_user.favorites.new(menu_id: menu.id)
        favorite.save
    end
    def destroy
    	menu = Menu.find(params[:menu_id])
        @id_name = "#favorite-link-#{menu.id}"
        favorite = current_user.favorites.find_by(menu_id: menu.id)
        favorite.destroy
    end
    private

      def menu_params
        @menu = Menu.find(params[:menu_id])
      end
end
