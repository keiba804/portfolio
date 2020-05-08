class Post < ApplicationRecord
	attachment :post_image
	belongs_to :restaurant
end
