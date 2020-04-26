class Menu < ApplicationRecord
	has_many :favorites, dependent: :destroy
	belongs_to :menu_category
	belongs_to :restaurant
end
