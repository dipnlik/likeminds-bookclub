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
  
  it "render a list of books this user rated" do
    book = stub_model(Book, id: -1, title: 'Moby Dick')
    @user.stub_chain(:ratings, :includes).and_return([stub_model(Rating, book: book, value: 4.0)])
    render
    assert_select "li" do
      assert_select "a[href=?]", "/books/-1", text: 'Moby Dick'
    end
    rendered.should match "\(4\.0\)"
  end
end
