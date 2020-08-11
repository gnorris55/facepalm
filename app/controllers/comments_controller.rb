class CommentsController < ApplicationController
    def create
        @comment = current_user.comments.new(comment_params)

        if @comment.save
            flash[:message] = "comment posted"
        else
            flash[:message] = "comment could not be posted"
        end

        redirect_to root_path
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :post_id)
    end
end
