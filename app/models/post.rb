class Post < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_many :comments

    has_many :likes, foreign_key: "liked_post_id"
    has_many :likers, through: :likes
    
end
