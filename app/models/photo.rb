# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  #mount_uploader :image, ImageUploader
  has_attached_file :file, :styles => {:main => "680x480>", :medium => "300x300>", :thumb => "217x", :little => "100x100#" }

  acts_as_taggable
  #acts_as_taggable_on :skills, :interests

  #attr_accessible :content, :file, :isanimal, :tag_list
  
  validates :content,:presence => true, :length => { :minimum => 25 }

  belongs_to :user

  #生成唯一的piid号
  after_create do |user|
    #piid = Digest::MD5.hexdigest(File.read(File.join(Rails.root,"public", user.file.to_s.split("?").first)))
    piid = Digest::MD5.hexdigest(Time.now.to_i.to_s)
    user.update_attribute(:piid, piid)
  end

  searchable do
    text :content
    text :tag_list do
      tag_list {|tag| tag.context  }
    end
    integer :category_id 
  end
  
end
