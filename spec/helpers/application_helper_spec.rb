require 'spec_helper'

describe ApplicationHelper do
  it "#login_header"
  it "#current_user uses session[:user_id] to retrieve the current user" do
    user = User.create(username: 'user', password: 'pass', password_confirmation: 'pass')
    session[:user_id] = user.id
    helper.current_user.should eq(user)
  end
end
