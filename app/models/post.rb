class Post < ApplicationRecord
	attachment :post_image
	belongs_to :restaurant
	validates :post_title, presence: true
	validates :post_body, presence: true
end
