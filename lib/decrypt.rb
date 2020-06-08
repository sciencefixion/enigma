require './lib/enigma'

file = ARGV[0]
file_2 = ARGV[1]
key = ARGV[2]
date = ARGV[3]

encrypted = File.open(file, 'r')
msg = encrypted.read().strip


outfile = File.new("#{file_2}", 'w')
outfile.puts("#{msg}")

encrypted.close()
outfile.close()

puts "Created '#{file_2}' with key and date"


# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818
