# -*- encoding: utf-8 -*- 
class CategoryController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create] 
  before_filter :init_categories, :only => [:index, :show]

  def index
    number = 16
    page = params[:page] || 1
    category_id = params[:cat_id] || 0
    #category_ids = @second.collect(&:id)
    category_ids = Category.select(:id).all.collect(&:id)
    @photos = Photo.where("category_id in (?)", category_ids).
              paginate(:page => page).
              order("created_at DESC").
              all 
    #@photos = Photo.order("created_at DESC").all
  end

  def new
    @category = Category.new
  end

  def create

  end

  def show
    id = params[:id]
    parent = Category.find_by_id id
    Rails.logger.info "depth is #{parent.depth}"
    @current = parent
    if parent.depth == 0
      @second = parent.children
      category_ids = @second.collect(&:id)
    elsif parent.depth == 1
      @first_parent = parent.parent
      @second = @first_parent.children
      @third = parent.children
      category_ids = @third.collect(&:id)
    elsif parent.depth == 2
      @first_parent = parent.root
      @second = @first_parent.children
      @third = parent.self_and_siblings
      category_ids = [@current.id]
    end
    @photos = Photo.where("category_id in (?)", category_ids).all 
    render :index
  end

  private
  def init_categories
    @first = Category.roots
    @second = @first.first.children
  end

end
