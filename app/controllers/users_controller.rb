class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end

    def request_follow
        @user = User.find(params[:user_id])
        @user.user_requests.create(requester_id: params[:requester_id])

        redirect_back(fallback_location: root_path)
    end

    def reject_friendship
        @user = User.find(params[:user_id])
        @user.user_requests.find_by(requester_id: params[:friend_id]).destroy

        redirect_back(fallback_location: root_path)
    end

    def like_post
        @user = User.find(current_user.id)
        @user.liked_posts << Post.find(params[:post_id])
        @user.save

        redirect_back(fallback_location: root_path)
        
    end
    
    def follow 
        @user = User.find(params[:user_id])
        @friend = User.find(params[:friend_id])

        @user.friendships.create(friend_id: @friend.id)
        @friend.friendships.create(friend_id: @user.id)
        @user.user_requests.find_by(requester_id: @friend.id).destroy
        
        redirect_back(fallback_location: root_path)

    end 


    def you_page 
        @user = User.find(current_user.id)
        @requests = UserRequest.all
    end

end
