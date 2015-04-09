class PhotobooksController < ApplicationController
  def createphotobook
    photobook = Photobook.new
    photobook.bookname = params[:bookname]
    photobook.save
    redirect_to :photobook
  end
  def setbookcover
          photobook = Photobook.find(params[:id])
          photobook.bookcover = params[:bookcover]
          photobook.save
          render :json => {success: true, src: photobook.to_json}
      end
end