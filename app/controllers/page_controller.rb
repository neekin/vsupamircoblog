class PageController < ApplicationController
  def welcome

  end

  def photobook
    @photobook = Photobook.all
  end
end
