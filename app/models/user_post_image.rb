class UserPostImage < ApplicationRecord
	belongs_to :user
	attachment :image
end
