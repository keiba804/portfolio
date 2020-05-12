class Restaurant < ApplicationRecord
	has_many :menus, dependent: :destroy
	has_many :restaurant_images, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :user_post_images, dependent: :destroy
	has_many :menu_categories, dependent: :destroy
	has_many :follower_user, through: :followed, source: :follower
	has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	attachment :restaurant_top_image
	enum restaurant_status:{ 非公表:0, 準備中:1, 空席余裕あり:2, 空席僅か:3, 満席:4}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
