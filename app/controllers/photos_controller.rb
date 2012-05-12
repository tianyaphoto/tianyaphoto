# -*- encoding : utf-8 -*-
# coding: utf-8
class PhotosController < ApplicationController
  load_and_authorize_resource :photo

  before_filter :authenticate_user!

  # GET /photos
  # GET /photos.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /photos/1/edit
  def edit
  end

  #TODO: 上传图片无法处理 process, 也许是mini_magick的问题
  def create

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, :notice => '图片上传成功.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, :notice => '图片已经被成功修改!' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
