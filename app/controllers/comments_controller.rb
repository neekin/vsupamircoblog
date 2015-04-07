class CommentsController < ApplicationController
   def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      render :json =>@comment.error
    end
   end

   def photocomments
     @photo = Photo.find(params[:photo_id])
     respond_to do |format|
       format.html { render layout: false }
     end
   end
  private
    def comment_params
      params.require(:comment).permit!
    end
end
