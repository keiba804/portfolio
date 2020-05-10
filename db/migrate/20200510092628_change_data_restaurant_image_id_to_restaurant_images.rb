class ChangeDataRestaurantImageIdToRestaurantImages < ActiveRecord::Migration[5.2]
  def change
  	change_column :restaurant_images, :restaurant_image_id, :text
  end
end
