class Book < ActiveRecord::Base
  attr_accessible :isbn, :title
  validates :title, presence: true
  validates :isbn, uniqueness: true
  
  has_many :ratings
  has_many :users, through: :ratings
  
  def rating_by_user_id(user_id)
    rating = self.ratings.find_by_user_id(user_id)
    rating ? rating.value : nil
  end
end
