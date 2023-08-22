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
        respond_to do |format|
            format.turbo_stream{render turbo_stream: turbo_stream.remove("comment_row_#{@comment.id}")}
            format.html { redirect_back(fallback_location: root_path)}
            format.json { head :no_content }
        end
        
    end
    
    
    private
    
      def comment_params
        params.require(:comment).permit(:content, :parent_id).merge(post_id: params[:post_id])
       end
end
