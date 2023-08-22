class PostsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.new(post_params)
        
        if @post.save
            redirect_to @post, notice: 'Post was Successfully created!'
        else
            render :new
        end
    end

    def edit
    end

    def destroy
        @post.destroy
        respond_to do |format|
                format.turbo_stream { render turbo_stream: turbo_stream.remove("post_row_#{@post.id}") } 
                format.html{redirect_to posts_url, notice: 'Post was Successfully Deleted'}
                format.json{head :no_content}
        end
    end

    def update
        if @post.update(post_params)
            redirect_to @post, notice: 'Post was Successfully Updated'
        else
            render :edit
        end
    end
      

      

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:name, :description, :image)
    end
end
