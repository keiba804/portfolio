class ChangeDataGenreToRestaurant < ActiveRecord::Migration[5.2]
  def change
  	change_column :menus, :takeout, :string
  end
end
