class Bad < ActiveRecord::Base
  belongs_to :result

  validates :name, presence: true
  validates :result, presence: true
end
