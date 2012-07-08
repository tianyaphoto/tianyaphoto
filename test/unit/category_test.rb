# -*- encoding: utf-8 -*-
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def test_load_yml_date
    Category.load_yml_date
    assert Category.count
    assert_equal 4, Category.find_by_name("长臂猿科").children.count
    assert_equal Category.find_by_name("野生动物"), Category.find_by_name("长臂猿科").parent
  end


end
