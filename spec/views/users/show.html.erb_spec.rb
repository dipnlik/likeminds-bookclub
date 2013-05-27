require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "Username",
      :password_digest => "Password Digest"
    ))
  end

  it "renders attributes in <p> (but not theirs password digests)" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    rendered.should_not match(/Password Digest/)
  end
end
