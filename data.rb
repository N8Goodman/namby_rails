require "uri"
require "net/http"


url = URI.parse("http://deron.meranda.us/data/census-dist-female-first.txt")
response = Net::HTTP.get_response(url)

File.open("girls.txt", "wb") do |file|
  file.write(response.body)
end

boys = URI.parse("http://deron.meranda.us/data/census-dist-male-first.txt")
response = Net::HTTP.get_response(boys)

File.open("boys.txt", "wb") do |file|
  file.write(response.body)
end
