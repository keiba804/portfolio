class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	has_many :favorites, dependent: :destroy
	has_many :user_post_images, dependent: :destroy
	has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
	has_many :following_user, through: :follower, source: :followed

	def follow(user_id)
	  follower.create(followed_id: user_id)
	end

	def unfollow(user_id)
	  follower.find_by(followed_id: user_id).destroy
	end

	def following?(user)
	  following_user.include?(user)
	end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
