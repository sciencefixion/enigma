require './lib/enigma'

file = ARGV[0]
file_2 = ARGV[1]
key = ARGV[2]
date = ARGV[3]

encrypted = File.open(file, 'r')
msg = encrypted.read().strip
enigma = Enigma.new
decrypted = enigma.decrypt(msg, key, date)

outfile = File.new("#{file_2}", 'w')
outfile.puts("#{decrypted[:decryption]}")

encrypted.close()
outfile.close()

puts "Created '#{file_2}' with key #{decrypted[:key]} and date #{decrypted[:date]}"
