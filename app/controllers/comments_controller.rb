class CommentsController < ApplicationController
    def create
        #Create a new comment
        @comment = current_user.comments.new(comment_params)
        if !@comment.save
            flash[:notice] = @comment.errors.full_messages.to_sentence
        end

        redirect_to post_path(params[:post_id])
    end

    #Destroy the comment
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_back(fallback_location: root_path)
    end
    
    
    private
    
      def comment_params
        params.require(:comment).permit(:content, :parent_id).merge(post_id: params[:post_id])
       end
end
