class MenuCategory < ApplicationRecord
	has_many :menus, dependent: :destroy
	belongs_to :restaurant

	enum active_status:{ 有効: 0, 無効: 1}

	validates :active_status, presence: true
	validates :menu_category_name, presence: true
end
