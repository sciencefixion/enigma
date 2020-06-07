class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  # def random_five_digit_num
  #   rand.to_s[2..6]
  # end

  def generate_keys
    rand.to_s[2..6]
    # num = random_five_digit_num
    # { A: num[0..1],
    #   B: num[1..2],
    #   C: num[2..3],
    #   D: num[3..4] }
  end

  def get_date
    Time.new.strftime("%d%m%y")
  end

  def generate_offsets(date = nil)
    date = get_date if date.nil?
    squared_date = (date.to_i ** 2)
    squared_date.to_s[-4..-1]
  end

  def find_shifts(keys = nil, date = nil)
    keys = generate_keys if keys.nil?
    offsets = generate_offsets(date) if offsets.nil?
    shifts = {}
    shifts[:A] = keys[0..1].to_i + offsets[0].to_i
    shifts[:B] = keys[1..2].to_i + offsets[1].to_i
    shifts[:C] = keys[2..3].to_i + offsets[2].to_i
    shifts[:D] = keys[3..4].to_i + offsets[3].to_i
    shifts
  end

  def encrypt(message, keys = nil, date = nil)
    # find_shifts(keys, date)

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
