class Restaurant < ApplicationRecord
	has_many :menus, dependent: :destroy
	has_many :restaurant_images, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :menu_categories, dependent: :destroy
	has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum restaurant_status:{ 準備中:0, 店内余裕あり:1, 空席僅か:2, 満席:3}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
