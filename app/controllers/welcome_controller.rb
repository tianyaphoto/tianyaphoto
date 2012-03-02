# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  #TODO:首页用于展示图片
  def index
    @photos = Photo.limit(6)
  end

  
  def form
  end
end
