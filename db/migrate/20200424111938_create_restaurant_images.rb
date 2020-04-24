class CreateRestaurantImages < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_images do |t|
      t.integer :admin_id
      t.string :restaurant_image_title
	  t.string :restaurant_image_body
      t.integer :restaurant_post_image_id
      t.timestamps
    end
  end
end
