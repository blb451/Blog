class PostsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]
  before_action :find_post, only: [:edit, :update, :destroy, :show]
  before_action :authorize_access, only: [:edit, :update, :destroy]
  before_action :set_page, only: [:index]
  POSTS_PER_PAGE = 10

      def new
        @post = Post.new
      end

      def create
        post_params = params.require(:post).permit([:title, :body, :category_id])
        @post = Post.new post_params
        @post.user = current_user
        if @post.save
          redirect_to post_path(@post)
        else
          render :new
        end
      end
#
      def show
        @comment = Comment.new
        @post = Post.find params[:id]
        @category = Category.find @post.category_id
      end


      def index
        @post = Post.order(created_at: :desc).limit(POSTS_PER_PAGE).offset(@page.to_i * POSTS_PER_PAGE)
      end

      def edit
        @post = Post.find params[:id]
      end

      def update
        @post = Post.find params[:id]
          post_params = params.require(:post).permit([:title, :body, :category_id])
        if @post.update post_params
          redirect_to post_path(@post)
        else
          render :edit
        end
      end

      def destroy
        @post = Post.find params[:id]
        @post.destroy
        redirect_to posts_path
      end

      def search
        search_query = params(:query)
        @query = Post.where(['title || body ILIKE ?', "#{search_query}"])
      end

      private

      def set_page
        @page = params[:page] || 0
      end

      def find_post
        @post = Post.find params[:id]
      end

      def authorize_access
        unless can? :manage, @post
        redirect_to root_path, alert: 'Access denied'
        end
      end
    end
