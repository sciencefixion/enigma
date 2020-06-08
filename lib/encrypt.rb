require './lib/enigma'

file = ARGV[0]
file_2 = ARGV[1]

message = File.open(file, 'r')
p message.read().strip

puts "Created '#{file_2}' with key_ and date_}"
