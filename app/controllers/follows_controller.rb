class FollowsController < ApplicationController
  def follow
    @follow = Follow.new
    follow.from_user_id = current_user.id
    follow.follow_user_id = params[:id]
    if follow.save
      respond_to do |format|
        format.js
      end
    else
      render :json => @follow.error
    end
  end
end

