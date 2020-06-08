class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def generate_keys
    rand.to_s[2..6]
  end

  def get_date
    Time.new.strftime("%d%m%y")
  end

  def generate_offsets(date)
    squared_date = (date.to_i ** 2)
    squared_date.to_s[-4..-1]
  end

  def find_shifts(keys = nil, date = nil)
    keys = generate_keys if keys.nil?
    date = get_date if date.nil?
    offsets = generate_offsets(date)
    shifts = {keys: keys, date: date}
    shifts[:A] = keys[0..1].to_i + offsets[0].to_i
    shifts[:B] = keys[1..2].to_i + offsets[1].to_i
    shifts[:C] = keys[2..3].to_i + offsets[2].to_i
    shifts[:D] = keys[3..4].to_i + offsets[3].to_i
    shifts
  end

  def encode(char, shift)
    if character_set.include?(char)
      character_set[(character_set.index(char) + shift) % character_set.length]
    else
      char
    end
 end

  def encrypt(message, key = nil, date = nil)
    shifts = find_shifts(key, date)
    encrypted = {encryption: "", key: "", date: ""}
    encrypted[:key] = shifts[:keys]
    encrypted[:date] = shifts[:date]

    msg = message.downcase.chars.each_with_index
    shifts_arr = shifts.values[2..5]

    encrypted[:encryption] << msg.map do |char, index|
      shift = shifts_arr[index % shifts_arr.length]
      encode(char, shift)
    end.join

    encrypted
  end

  def decrypt(message, key = nil, date = nil)
    shifts = find_shifts(key, date)
    decrypted = {decryption: "", key: "", date: ""}
    decrypted[:key] = shifts[:keys]
    decrypted[:date] = shifts[:date]

    msg = message.downcase.chars.each_with_index
    shifts_arr = shifts.values[2..5]

    decrypted[:decryption] << msg.map do |char, index|
      shift = shifts_arr[index % shifts_arr.length]
      encode(char, (27 - shift))
    end.join

    decrypted
  end
end
