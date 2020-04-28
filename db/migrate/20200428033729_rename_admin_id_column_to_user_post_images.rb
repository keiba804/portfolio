class RenameAdminIdColumnToUserPostImages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :user_post_images, :admin_id, :restaurant_id
  end
end
