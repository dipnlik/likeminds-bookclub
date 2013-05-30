require 'spec_helper'

describe "books/edit" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :title => "MyString",
      :isbn => "MyString"
    ))
    @user_rating = 4.0
    assign(:current_user, stub_model(User, username: 'user'))
  end

  it "renders the edit book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", book_path(@book), "post" do
      assert_select "input#book_title[name=?]", "book[title]"
      assert_select "input#book_isbn[name=?]", "book[isbn]"
      assert_select "select#rating[name=?]", "rating" do
        (0..5).each do |value|
          assert_select "option[value=?]", value.to_f
        end
        assert_select "option[value=?][selected=selected]", @user_rating
      end
    end
  end
  
  describe "the 'other ratings' block" do
    it "should not render for common users" do
      assign(:current_user, stub_model(User, username: 'user', admin?: false))
      render
      assert_select 'div#other_ratings', count: 0
    end
    
    it "should not render for admins if the book has no other ratings" do
      assign(:current_user, stub_model(User, username: 'user', admin?: true))
      render
      assert_select 'div#other_ratings', count: 0
    end
    
    it "should render for admins but only if the book has other ratings" do
      assign(:current_user, stub_model(User, username: 'user', admin?: true))
      @book.stub(:ratings).and_return([stub_model(Rating, user: stub_model(User, username: 'user'))])
      render
      assert_select 'div#other_ratings'
    end
  end
end
