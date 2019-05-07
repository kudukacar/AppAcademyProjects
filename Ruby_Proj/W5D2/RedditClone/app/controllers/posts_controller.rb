class PostsController < ApplicationController

    before_action :ensure_logged_in

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = current_user.posts.find(params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy!
        redirect_to sub_url(@post.sub_id)
    end

    def post_params
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end

end