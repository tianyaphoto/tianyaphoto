# -*- encoding: utf-8 -*- 
class CategoryController < ApplicationController
  before_filter :init_categories, :authenticate_user! 

  def index
    category_id = params[:cat_id] || 0
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
  end

end
