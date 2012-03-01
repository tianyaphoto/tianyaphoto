# -*- encoding : utf-8 -*-
require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "visit welcome index page" do
    get "welcome/index"
    assert_response :success
  end
end
