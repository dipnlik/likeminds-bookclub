require 'spec_helper'

describe "sessions/new.html.erb" do
  it "should show alert, if any" do
    flash[:alert] = 'Login error'
    render
    assert_select 'p#alert', 'Login error'
  end
  
  it "should have a login form" do
    render
    assert_select "form[action=?][method=?]", login_path, "post" do
      assert_select "input#username[name=username]"
      assert_select "input#password[type=password][name=password]"
      assert_select "input[type=submit]"
    end
  end
  
  it "should have a link to create an account" do
    render
    assert_select "a[href=/users/new]"
  end
end
