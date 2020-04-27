class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :restaurant_id
      t.string :post_title
      t.string :post_body
      t.integer :post_image
      t.timestamps
    end
  end
end
