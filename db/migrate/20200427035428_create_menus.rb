class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.integer :menu_category_id
      t.string :menu_name
      t.string :explanation
      t.string :price
      t.string :takeout
      t.string :sales_status

      t.timestamps
    end
  end
end
