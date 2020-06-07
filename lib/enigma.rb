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

  def encrypt(message, keys = nil, date = nil)

    shifts = find_shifts(keys, date)
    encrypt = {encryption: "", key: shifts[keys], date: find_shifts[date]}

    # message.downcase.each_char do |char|
    #   if character_set.include?(char)
    #     if
    #   else
    #     char = char
    #   end
    # end


    # from CaesarCipher for reference
    # shift = shift.to_i
    # string = string.upcase
    #
    # string.each_char do |n|
    #   if n == " "
    #     p " "
    #   else
    #     p @plain[@plain.index(n) - shift]
    #   end
    # end
  end
end
