require 'spec_helper'

describe User do
  before(:each) do
    User.create(username: 'user', password: 'pass', password_confirmation: 'pass')
  end
  
  it "username should be present and unique" do
    User.new(username: '').should have(1).errors_on(:username)
    User.new(username: 'user').should have(1).errors_on(:username)
    User.new(username: 'uSeR').should have(1).errors_on(:username)
    User.new(username: 'another').should have(:no).errors_on(:username)
  end
  
  it "password should be present and confirmed" do
    User.new(password: '', password_confirmation: '').should have(1).errors_on(:password)
    User.new(password: '123', password_confirmation: '').should have(1).errors_on(:password)
    User.new(password: '123', password_confirmation: '456').should have(1).errors_on(:password)
    User.new(password: '123', password_confirmation: '123').should have(:no).errors_on(:password)
  end
  
  it "#admin? determines if an user is in the administrators list or not" do
    class User
      @@ADMIN_USERNAMES = %w(alfa beta).freeze
    end
    User.new(username: 'alfa').should be_an_admin
    User.new(username: 'Beta').should be_an_admin
    User.new(username: 'gama').should_not be_an_admin
    User.new(username: 'admin').should_not be_an_admin
  end
end
