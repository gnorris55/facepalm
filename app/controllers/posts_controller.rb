class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = current_user.posts.build
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
