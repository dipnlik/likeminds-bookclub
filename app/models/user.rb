class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :password_digest
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true
  has_secure_password
  
  has_many :ratings
  has_many :books, through: :ratings
end
