require 'spec_helper'

describe "books/index" do
  before(:each) do
    @books = [
      stub_model(Book, title: "Title", isbn: "Isbn"),
      stub_model(Book, title: "Title", isbn: "Isbn"),
    ]
    @books.stub({ current_page: 1, total_pages: 1, limit_value: 1 })
    assign(:books, @books)
  end

  it "renders a list of books" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
  end
  
  describe "pagination" do
    it "renders if needed" do
      @books.stub({ current_page: 1, total_pages: 2, limit_value: 2 })
      render
      assert_select "nav.pagination"
    end

    it "doesn't render if not needed" do
      @books.stub({ current_page: 1, total_pages: 1, limit_value: 2 })
      render
      assert_select "nav.pagination", count: 0
    end
  end
end
