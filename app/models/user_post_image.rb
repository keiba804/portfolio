class UserPostImage < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant
	attachment :user_post_image
	validates :user_post_image, presence: true
end
