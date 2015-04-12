class PageController < ApplicationController
  def welcome
    #@mircoblogs= Mircoblog.all.reverse.take(10)

    #render :action=>"getMircoblogs"

  end

  def photobook
    @photobook = Photobook.all
  end
end
