class RenameRestaurantPostImageIdColumnToRestaurantImages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :restaurant_images, :restaurant_post_image_id, :restaurant_image_id
  end
end
