class CreateMenuCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_categories do |t|
      t.integer :admin_id
      t.string :menu_category_name
      t.integer :active_status
      t.timestamps
    end
  end
end
