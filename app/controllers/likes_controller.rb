class LikesController < ApplicationController
    before_action :authenticate_user!, except: [:like, :unlike]

    def create 
        @post = Post.find(params[:post_id])
        @like = current_user.likes.new(post: @post)

        if @like.save
            redirect_to @post, notice: 'You Liked the Post!'
        else
            redirect_to @post, alert: 'Failed to Like the Post!'
        end
    end

    def destroy
        @post =  Post.find(params[:id])
        @Like = current_user.likes.find_by(post: @post)

        if @Like
            @Like.destroy
            redirect_to @post, notice: 'You Unliked the Post!'
        else
            redirect_to @post, alert: 'Faild to Unliked the Post!'
        end
    end
end
