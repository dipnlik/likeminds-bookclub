class Book < ActiveRecord::Base
  attr_accessible :isbn, :title
  validates :title, presence: true
  validates :isbn, uniqueness: true
end
