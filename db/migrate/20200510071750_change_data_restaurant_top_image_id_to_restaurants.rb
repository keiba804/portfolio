class ChangeDataRestaurantTopImageIdToRestaurants < ActiveRecord::Migration[5.2]
  def change
  	change_column :restaurants, :restaurant_top_image_id, :text
  end
end
