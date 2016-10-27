class CommentsController < ApplicationController
  before_action :authenticate_user


    def create
      comment_params = params.require(:comment).permit([:body])
      @comment = Comment.new comment_params
      @post = Post.find params[:post_id]
      @comment.user = current_user
        @comment.post = @post
          if @comment.save
            redirect_to post_path(@post), notice: 'Comment created'
          else
            render 'posts/show'
          end
      end


      def destroy
        post = Post.find params[:post_id]
        @comment = Comment.find params[:id]
        if can? :delete, @comment
          @comment.destroy
          redirect_to post_path(post), notice: 'Comment deleted'
        else
          redirect_to home_path, notice: 'Access denied'
      end
    end
end
