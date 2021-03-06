# -*- encoding : utf-8 -*-
# coding: utf-8
class PhotosController < ApplicationController
  load_and_authorize_resource :photo

  before_filter :authenticate_user!, :except => "show"

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
    @cates = []
    cate = @photo.category
    @cates << cate
    @cates << cate.parent if cate.depth > 0
    @cates << cate.root if cate.depth > 1
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

  def create
    @photo = current_user.photos.new(params[:photo])
    respond_to do |format|
      if @photo.save
        format.html { redirect_to new_photo_path, :notice => '图片上传成功.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.accessible_by(current_ability).find(params[:id])
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
