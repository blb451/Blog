class CommentsController < ApplicationController

    def create
      comment_params = params.require(:comment).permit([:body])
      @comment = Comment.new comment_params
      @post = Post.find params[:post_id]
      @comment.user = @current_user
        @comment.post = @post
          if @comment.save
            redirect_to post_path(@post), notice: 'Comment created'
          else
            render 'show'
          end
      end


      def destroy
        post = Post.find params[:post_id]
        comment = Comment.find params[:id]
        comment.destroy
        redirect_to post_path(post), notice: 'Comment deleted'
      end

end
