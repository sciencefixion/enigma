class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def random_five_digit_num
    rand.to_s[2..6]
  end

  def generate_keys
    num = random_five_digit_num
    keys = Hash.new
    keys[:A] = num[0..1]
    keys[:B] = num[1..2]
    keys[:C] = num[2..3]
    keys[:D] = num[3..4]
    keys
  end

  def get_date
    Time.new.strftime("%d%m%y")
  end

  def generate_offsets
    squared_date = get_date.to_i ** 2
    offsets = {
      A: squared_date[-4],
      B: squared_date[-3],
      C: squared_date[-2],
      D: squared_date[-1]
    }
  end
end
