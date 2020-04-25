class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :admin_id
      t.string :title
      t.text :body
      t.integer :post_image_id

      t.timestamps
    end
  end
end
