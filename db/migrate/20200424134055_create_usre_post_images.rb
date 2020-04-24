class CreateUsrePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :usre_post_images do |t|
      t.integer :user_id
      t.integer :admin_id
      t.string :user_image_title
      t.integer :user_post_image_id
      t.timestamps
    end
  end
end
