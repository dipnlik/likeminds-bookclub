require 'spec_helper'

describe "books/show" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :title => "Title",
      :isbn => "Isbn"
    ))
    @all_ratings = assign(:all_ratings, 'user1 (2.0), user2 (3.0)')
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Isbn/)
  end
  
  it "shows every user's rating for this book" do
    render
    rendered.should include(@all_ratings)
  end
end
