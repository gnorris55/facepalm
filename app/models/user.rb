class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_attached_file :profile_picture, styles: {thumb: "50x50>"}, default_url: "https://t3.ftcdn.net/jpg/00/64/67/52/240_F_64675209_7ve2XQANuzuHjMZXP3aIYIpsDKEbF5dD.jpg"
  validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/

  has_many :posts, foreign_key: "author_id", :dependent => :destroy
  
  has_many :user_requests
  has_many :friendships

  has_many :comments

  has_many :likes, foreign_key: "liker_id"
  has_many :liked_posts, through: :likes, source: :liked_post
end
