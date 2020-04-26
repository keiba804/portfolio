class RenameGenreColumnToRestaurants < ActiveRecord::Migration[5.2]
  def change
  	rename_column :restaurants, :genre, :menu_category
  end
end
