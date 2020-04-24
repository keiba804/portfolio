class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.integer :menu_category_id
      t.string :name
      t.text :explanation
      t.integer :price
      t.integer :takeout
      t.integer :sales_status
      t.timestamps
    end
  end
end
