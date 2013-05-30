require 'spec_helper'

describe ApplicationController do
  controller do
  end
  
  describe "#current_user" do
    it "#current_user uses session[:user_id] to retrieve the current user and cache it" do
      user = User.create(username: 'user', password: 'pass', password_confirmation: 'pass')
      session[:user_id] = user.id
      controller.current_user.should eq(user)
      assigns(:current_user).should eq(user)
    end
  end
end
