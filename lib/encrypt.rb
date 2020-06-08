require './lib/enigma'

file = ARGV[0]
file_2 = ARGV[1]

message = File.open(file, 'r')
msg = message.read().strip
enigma = Enigma.new
encrypted = enigma.encrypt(msg)

outfile = File.new("#{file_2}", 'w')
outfile.puts("#{encrypted[:encryption]}")

message.close()
outfile.close()

puts "Created '#{file_2}' with key #{encrypted[:key]} and date #{encrypted[:date]}"
