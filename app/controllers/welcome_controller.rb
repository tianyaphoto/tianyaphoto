# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  
  
  def index
    key = params[:k]
    number = 16
    page = params[:page] || 1
    if key
      @photos = Photo.search do 
        fulltext key
      end.results
    else
      @photos = Photo.paginate(:page => page).order("created_at DESC")
    end
  end

  
  def form
    
  end
end
