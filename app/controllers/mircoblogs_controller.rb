class MircoblogsController < ApplicationController
  def create
   mircoblog = Mircoblog.new(mircoblog_params)
    mircoblog.save
    redirect_to :root
  end

  def showformid
    @mricoblog = Mircoblog.find(params[:id])
  end
  private
  def mircoblog_params
    params.require(:mircoblog).permit(:sharetext,:user_id)
  end
end
