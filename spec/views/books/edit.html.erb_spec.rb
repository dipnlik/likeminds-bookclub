require 'spec_helper'

describe "books/edit" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :title => "MyString",
      :isbn => "MyString"
    ))
    @user_rating = 4.0
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
end
