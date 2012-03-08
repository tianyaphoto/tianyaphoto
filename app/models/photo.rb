# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  #mount_uploader :image, ImageUploader
  has_attached_file :file, :styles => {:main => "680x480>", :medium => "300x300>", :thumb => "130x100>" }

  #TODO：属性需要限制，content的长度，还有就是自动生成id的问题，以及图片的搜索问题
end
