class MenuCategory < ApplicationRecord
	has_many :menus, dependent: :destroy

	enum active_status:{ 有効: 0, 無効: 1}
end
