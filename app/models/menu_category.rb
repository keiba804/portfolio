class MenuCategory < ApplicationRecord
	has_many :menus, dependent: :destroy
end
