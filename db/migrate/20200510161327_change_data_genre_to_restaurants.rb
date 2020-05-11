class ChangeDataGenreToRestaurants < ActiveRecord::Migration[5.2]
  def change
  	change_column :restaurants, :genre, :text
  end
end
