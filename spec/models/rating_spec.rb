require 'spec_helper'

describe Rating do
  before(:each) do
    Rating.create!(book_id: 1, user_id: 1, value: 5)
  end
  
  it "should have unique book_id and user_id" do
    Rating.new(book_id: 1, user_id: 1).should have(1).error_on(:book_id)
    Rating.new(book_id: nil, user_id: 1).should have(1).error_on(:book_id)
    Rating.new(book_id: 1, user_id: nil).should have(1).error_on(:user_id)
  end
  
  it "value should be between 0 and 5" do
    Rating.new(value: 5.1).should have(1).error_on(:value)
    Rating.new(value: -1).should have(1).error_on(:value)
    Rating.new.should have(:no).error_on(:value)
    Rating.new.value.should eq(0)
  end
end
