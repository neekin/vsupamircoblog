class PhotosController < ApplicationController
  def uploadphoto
    file = params[:qqfile]
    @photo=Photo.new
    @photo.file = file
    @photo.photobook_id = params[:photobook_id]
    @photo.filename = params[:qquuid]
    @photo.original_filename = file.original_filename
    if @photo.save
      render :json => {success: true, src: @photo.to_json}
    else
      render :json => @photo.errors.to_json
    end
  end

  def showphoto
    @photo = Photo.find(params[:photo_id])
    respond_to do |format|
      format.html { render layout: false }
    end
  end

  def photolist
    @photolist = Photo.where(:photobook_id => params[:photobook_id])
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end
