class Menu < ApplicationRecord
	has_many :favorites, dependent: :destroy
	belongs_to :menu_category
	belongs_to :restaurant

	enum sales_status:{ 販売中: 0, 売切: 1}
	enum takeout:{ ○: 0, ×: 1}
end
