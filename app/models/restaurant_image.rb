class RestaurantImage < ApplicationRecord
	belongs_to :restaurant
	attachment :restaurant_image
	validates :restaurant_image, presence: true
end
