class Book < ActiveRecord::Base
  attr_accessible :isbn, :title
  validates :title, presence: true
  validates :isbn, uniqueness: true
  
  has_many :ratings
  has_many :users, through: :ratings
end
