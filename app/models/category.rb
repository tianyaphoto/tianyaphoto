# -*- encoding: utf-8 -*-
class Category < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :name, :parent_id

  class << self
    #初始化category的数据库表数据
    def load_yml_date
      file = File.join(Rails.root, "lib", "categories.yml")
      dates = YAML.load_file file
      init_categories dates
    end

    def init_categories(dates, parent = nil)
      return if dates.empty? || (!dates.is_a?Hash)
      dates.each do |key, value|
        cat = Category.create(:name => key)
        cat.move_to_child_of parent if parent
        if value.is_a? Hash
          init_categories(value, cat)    
        else
          value.split(" ").each do |val|
            child = Category.create(:name => val)
            child.move_to_child_of cat
          end
        end
      end
    end

  end

end
