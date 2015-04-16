class MircoblogsController < ApplicationController
  def create
    mircoblog = Mircoblog.new(mircoblog_params)
    mircoblog.user_id =current_user.id
    mircoblog.save
    redirect_to :root
  end
  def getmircoblogs
     page = params[:page].to_i
     @mircoblogs= Mircoblog.all.reverse.drop(10*page).take(10)
    respond_to do |format|
      format.js   # { render layout: false }
    end
  end
  def showformid
    @mricoblog = Mircoblog.find(params[:id])
  end
  private
  def mircoblog_params
    params.require(:mircoblog).permit(:sharetext)
  end
end
