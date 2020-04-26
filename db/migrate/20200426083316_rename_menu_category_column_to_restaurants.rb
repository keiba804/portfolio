class RenameMenuCategoryColumnToRestaurants < ActiveRecord::Migration[5.2]
  def change
  	rename_column :restaurants, :menu_category, :genre
  end
end
