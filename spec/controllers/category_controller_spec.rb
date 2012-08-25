require 'spec_helper'

describe CategoryController do 

  let(:user) {
    FactoryGirl.create :user
  }

  describe "GET index" do

    before do
      sign_in user
    end

    it "should return success" do
      get :index
      response.should be_success
    end
  end

end
