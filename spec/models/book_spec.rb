require 'spec_helper'

describe Book do
  before(:each) do
    Book.create(title: 'A Book', isbn: '0123456789')
  end
  
  it "should have a name" do
    Book.create(title: '').should have(1).errors_on(:title)
    Book.create(title: 'A Book').should have(:no).errors_on(:title)
  end
  
  it "should have an unique and valid isbn" do
    Book.create(isbn: '0123456789').should have(1).errors_on(:isbn)
    Book.create(isbn: '0123456788').should have(:no).errors_on(:isbn)
  end
end
