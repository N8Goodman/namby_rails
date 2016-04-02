class Kid < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  validates :name, presence: true
  validates :gender, presence: true, inclusion: {in: ['boy','girl']}
  validates :first_letter, presence: true
  validates :last_letter, presence: true
end
