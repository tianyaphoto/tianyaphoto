# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  #TODO:首页用于展示图片
  def index
    @photos = Photo.all
  end

  
  def form
  end
end
