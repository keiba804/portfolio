class Post < ApplicationRecord
	attachment :image
	belongs_to :restaurant
end
