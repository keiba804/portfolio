class Menu < ApplicationRecord
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
            favorites.where(user_id: user.id).exists?
    end
	belongs_to :menu_category
	belongs_to :restaurant

	enum sales_status:{ 販売中: 0, 売切: 1}
	enum takeout:{ 可能: 0, 不可: 1}
end
