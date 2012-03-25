# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  #TODO:首页用于展示图片
  def index
    key = params[:k]
    number = 18
    if key
      @photos = Photo.where("content like ?", "%#{key}%").limit(number).order("created_at DESC")
    else
      @photos = Photo.limit(number).order("created_at DESC")
    end
  end

  
  def form
    
  end
end
