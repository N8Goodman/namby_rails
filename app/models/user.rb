class User < ActiveRecord::Base
  has_secure_password

  has_many :results
  has_many :favorites
  has_many :kids, through: :favorites

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
