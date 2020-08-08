class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @posts = Post.all
    end

    def new
        @post = current_user.posts.build
    end 

    def show
        @post = Post.find(params[:id])
        @author = @post.author
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = current_user.posts.update(posts_params)
        redirect_to post_path(@post)
    end

    def create
        @post = current_user.posts.build(posts_params)
        p = @post.errors.messages
        if @post.save 
            redirect_to root_path
        else
            redirect_to new_post_path
        end
    end 

    private
    def posts_params
        params.require(:post).permit(:body)
    end
end
