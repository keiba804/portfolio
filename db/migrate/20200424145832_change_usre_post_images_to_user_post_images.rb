class ChangeUsrePostImagesToUserPostImages < ActiveRecord::Migration[5.2]
  def change
  	rename_table :usre_post_images, :user_post_images
  end
end
