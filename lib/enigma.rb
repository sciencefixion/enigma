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

  def generate_offsets
    squared_date = (get_date.to_i ** 2)
    squared_date.to_s[-4..-1]
  end

  def find_shifts(keys = nil, offsets = nil)
    keys = generate_keys if keys.nil?
    offsets = generate_offsets if offsets.nil?
    require 'pry'; binding.pry
    # shifts = {
    #   :A => keys[0..1].to_i + ,
    #   :B => keys[1..2].to_i + ,
    #   :C => keys[2..3].to_i + ,
    #   :D => keys[3..4].to_i +
    # }
  end

  def encrypt(message, key = nil, date = nil)

  end
end
