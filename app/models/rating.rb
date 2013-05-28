class Rating < ActiveRecord::Base
  attr_accessible :book_id, :user_id, :value
  
  validates :book_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true
  validates :value, inclusion: (0..5)
  
  belongs_to :book
  belongs_to :user
end
