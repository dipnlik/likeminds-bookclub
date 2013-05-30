require 'spec_helper'

describe "books/new" do
  before(:each) do
    assign(:book, stub_model(Book,
      :title => "MyString",
      :isbn => "MyString"
    ).as_new_record)
    assign(:current_user, stub_model(User, username: 'user'))
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", books_path, "post" do
      assert_select "input#book_title[name=?]", "book[title]"
      assert_select "input#book_isbn[name=?]", "book[isbn]"
      assert_select "select#rating[name=?]", "rating" do
        (0..5).each do |value|
          assert_select "option[value=?]", value.to_f
        end
      end
    end
  end
  
  describe "the 'other ratings' block" do
    it "should not render for common users" do
      assign(:current_user, stub_model(User, username: 'user', admin?: false))
      render
      assert_select 'div#other_ratings', count: 0
    end
    
    it "should not render for admin users" do
      assign(:current_user, stub_model(User, username: 'user', admin?: true))
      render
      assert_select 'div#other_ratings', count: 0
    end
  end
end
