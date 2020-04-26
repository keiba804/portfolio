class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favorites, dependent: :destroy
  has_many :user_post_images, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
