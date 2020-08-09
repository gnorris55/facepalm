class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end

    def follow
        @user = User.find(params[:user_id])
        @user.user_requests.create(requester_id: params[:requester_id])

        redirect_to root_path
    end

    def you_page 
        @user = User.find(current_user.id)
        @requests = UserRequest.all
    end

end
