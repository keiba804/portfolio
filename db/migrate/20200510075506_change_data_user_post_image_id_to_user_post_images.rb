class ChangeDataUserPostImageIdToUserPostImages < ActiveRecord::Migration[5.2]
  def change
  	change_column :user_post_images, :user_post_image_id, :text
  end
end
