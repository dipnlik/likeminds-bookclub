require 'spec_helper'

describe SessionsController do
  it "should not receive authentication check" do
    controller.should_not_receive(:check_authentication)
    get :new
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @user = User.create!(username: 'user', password: 'pass', password_confirmation: 'pass')
    end
    
    it "with correct credentials, should log user in" do
      post :create, username: 'user', password: 'pass'
      session[:user_id].should eq(@user.id)
      response.should redirect_to user_url(@user)
    end
    
    it "with wrong credentials, should not log in and warn the user" do
      post :create, username: 'user', password: 'wrong'
      session[:user_id].should be_blank
      flash[:alert].should_not be_blank
      response.should redirect_to login_url
    end
  end

  describe "GET 'destroy'" do
    it "should log out the user and redirect to the login page" do
      session[:user_id] = -1
      delete :destroy
      session[:user_id].should be_nil
      response.should redirect_to login_url
    end
  end

end
