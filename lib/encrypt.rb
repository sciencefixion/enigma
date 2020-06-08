require './lib/enigma'

file = ARGV[0]
file_2 = ARGV[1]

message = File.open(file, 'r')
msg = message.read().strip

outfile = File.new("#{file_2}", 'w')
outfile.puts("#{msg}")

message.close()
outfile.close()

puts "Created '#{file_2}' with key_ and date_}"
