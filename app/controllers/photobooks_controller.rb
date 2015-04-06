class PhotobooksController < ApplicationController
  def createphotobook
    photobook = Photobook.new
    photobook.bookname = params[:bookname]
    photobook.save
    redirect_to :photobook
  end
end
