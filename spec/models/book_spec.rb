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
  
  it "has many ratings" do
    Book.new.should respond_to(:ratings)
    rating = Rating.create(book_id: 1, user_id: 1)
    Book.last.ratings.should eq([rating])
  end
  
  it "has many users through ratings" do
    Book.new.should respond_to(:users)
    user = User.create(username: 'user', password: 'pass', password_confirmation: 'pass')
    Rating.create(book_id: 1, user_id: 1)
    Book.last.users.should eq([user])
  end
  
  describe "#rating_by_user_id" do
    it "should return the rating value for that user id" do
      user = User.create(username: 'user', password: 'pass', password_confirmation: 'pass')
      Rating.create(book_id: Book.last.id, user_id: user.id, value: 2.5)
      Book.last.rating_by_user_id(user.id).should eq(2.5)
    end
    
    it "should return nil if the user didn't rate this book" do
      user = User.create(username: 'user', password: 'pass', password_confirmation: 'pass')
      Book.last.rating_by_user_id(user.id).should be_nil
    end
  end
  
  describe "#all_ratings" do
    it "should return a string with all usernames and ratings" do
      user1 = User.create(username: 'user1', password: 'pass', password_confirmation: 'pass')
      user2 = User.create(username: 'user2', password: 'pass', password_confirmation: 'pass')
      book = Book.last
      Rating.create(user_id: user2.id, book_id: book.id, value: 3.0)
      Rating.create(user_id: user1.id, book_id: book.id, value: 2.0)
      book.all_ratings.should eq('user1 (2.0), user2 (3.0)')
    end
  end
end
