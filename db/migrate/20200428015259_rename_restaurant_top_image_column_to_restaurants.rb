class RenameRestaurantTopImageColumnToRestaurants < ActiveRecord::Migration[5.2]
  def change
  	rename_column :restaurants, :restaurant_top_image, :restaurant_top_image_id
  end
end
