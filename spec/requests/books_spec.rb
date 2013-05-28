require 'spec_helper'

describe "Books" do
  describe "GET /books" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      User.create!({username: 'user', password: 'pass', password_confirmation: 'pass'})
      post login_path, username: 'user', password: 'pass'
      get books_path
      response.status.should be(200)
    end
  end
end
