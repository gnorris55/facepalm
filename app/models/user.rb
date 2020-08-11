class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: "author_id", :dependent => :destroy
  
  has_many :user_requests
  has_many :friendships

  has_many :comments

  has_many :likes, foreign_key: "liker_id"
  has_many :liked_posts, through: :likes, source: :liked_post
end
