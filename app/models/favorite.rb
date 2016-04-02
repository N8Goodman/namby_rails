class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :kid

  validates :user, presence: true
  validates :kid, presence: true
end
