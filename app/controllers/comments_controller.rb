class CommentsController < ApplicationController
    
    def create
        find_commentable()
        @comment = @commentable.comments.build(comment_params)
        @comment.save
        redirect_to @commentable
    end

    private 

    def comment_params
        params.require(:comment).permit(:body, :parent_id)
                                .merge(user_id: current_user.id)
    end  

    def find_commentable
        @commentable = Post.find_by_id(params[:post_id])
    end
end