class UserPostImage < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant
	attachment :user_post_image
end
