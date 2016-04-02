File.foreach('girls.txt') do |row|
  Kid.create(name: row.split[0].downcase.capitalize, first_letter: row.split[0].downcase.first, last_letter: row.split[0].downcase.last, gender: 'girl')
end

File.foreach('boys.txt') do |row|
  Kid.create(name: row.split[0].downcase.capitalize, first_letter: row.split[0].downcase.first, last_letter: row.split[0].downcase.last, gender: 'boy')
end
