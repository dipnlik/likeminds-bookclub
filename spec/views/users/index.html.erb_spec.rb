require 'spec_helper'

describe "users/index" do
  before(:each) do
    @users = [
      stub_model(User, username: "Username", password_digest: "Password Digest"),
      stub_model(User, username: "Username", password_digest: "Password Digest"),
    ]
    @users.stub({ current_page: 1, total_pages: 1, limit_value: 1 })
    assign(:users, @users)
  end

  it "renders a list of users but not their password digests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 0
  end

  describe "pagination" do
    it "renders if needed" do
      @users.stub({ current_page: 1, total_pages: 2, limit_value: 2 })
      render
      assert_select "nav.pagination"
    end

    it "doesn't render if not needed" do
      @users.stub({ current_page: 1, total_pages: 1, limit_value: 2 })
      render
      assert_select "nav.pagination", count: 0
    end
  end
end
