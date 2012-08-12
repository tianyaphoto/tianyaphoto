# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  
  
  def index
    key = params[:k]
    number = 18
    page = params[:page] || 1
    if key
      #@photos = Photo.where("content like ?", "%#{key}%").limit(number).order("created_at DESC")
      @photos = Photo.search do 
        fulltext key
      end.results
    else
      @photos = Photo.limit(number).order("created_at DESC")
    end
  end

  
  def form
    
  end
end
