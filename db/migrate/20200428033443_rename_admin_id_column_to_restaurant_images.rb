class RenameAdminIdColumnToRestaurantImages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :restaurant_images, :admin_id, :restaurant_id
  end
end
