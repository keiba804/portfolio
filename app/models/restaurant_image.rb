class RestaurantImage < ApplicationRecord
	belongs_to :restaurant
	attachment :restaurant_image
end
