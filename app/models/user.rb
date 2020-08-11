class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: "author_id", :dependent => :destroy
  has_many :user_requests

  scope :friends, -> {where}

  has_many :friendships
  has_many :comments
end
