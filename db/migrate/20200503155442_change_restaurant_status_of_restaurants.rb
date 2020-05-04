class ChangeRestaurantStatusOfRestaurants < ActiveRecord::Migration[5.2]
  def up
  	change_column :restaurants, :restaurant_status, :integer, default: '0'
  end
  def down
  	change_column :restaurants, :restaurant_status, :integer
  end
end
