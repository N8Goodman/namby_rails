class Result < ActiveRecord::Base
  GENDER = [
    ["Boy", "boy"],
    ["Girl", "girl"]
  ]

  ALPHABET = [
    ['All', '*'],
    ['A', 'a'],
    ['B', 'b'],
    ['C', 'c'],
    ['D', 'd'],
    ['E', 'e'],
    ['F', 'f'],
    ['G', 'g'],
    ['H', 'h'],
    ['I', 'i'],
    ['J', 'j'],
    ['K', 'k'],
    ['L', 'l'],
    ['M', 'm'],
    ['N', 'n'],
    ['O', 'o'],
    ['P', 'p'],
    ['Q', 'q'],
    ['R', 'r'],
    ['S', 's'],
    ['T', 't'],
    ['U', 'u'],
    ['V', 'v'],
    ['W', 'w'],
    ['X', 'x'],
    ['Y', 'y'],
    ['Z', 'z']
  ]

  COUNTER = [
    ['10', "10 names"],
    ['25', "25 names"],
    ['50', "50 names"],
    ['100', "100 names"]
  ]

  has_many :bads

  validates :count,
  presence: true
  validates :name, presence: true
  validates :gender, presence: true, inclusion: {in: ['boy','girl']}
  validates :starts_with, length: {is: 1}, allow_nil: true
  validates :ends_with, length: {is: 1}, allow_nil: true

end
