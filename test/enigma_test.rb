require './test/setup'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_a_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.character_set
  end

  # def test_random_five_digit_num
  #   assert_equal 5, @enigma.random_five_digit_num.length
  # end

  def test_generate_keys
    # # assert_instance_of Hash, @enigma.generate_keys
    # assert_equal 4, @enigma.generate_keys.length
    # assert_equal 2, @enigma.generate_keys[:A].length
    assert_instance_of String, @enigma.generate_keys
    assert_equal 5, @enigma.generate_keys.length
  end

  def test_get_date
    assert_instance_of String, @enigma.get_date
    assert_equal 6, @enigma.get_date.length
  end

  def test_generate_offsets
    @enigma.stubs(:get_date).returns("040895")

    assert_instance_of String, @enigma.generate_offsets
    assert_equal "1025", @enigma.generate_offsets
  end

  def test_it_can_find_shifts
    key = "02715"
    @enigma.stubs(:get_date).returns("040895")
    expected = {
      :A => 3,
      :B => 27,
      :C => 73,
      :D => 20
    }

    assert_instance_of Hash, @enigma.find_shifts(key)
    assert_equal expected, @enigma.find_shifts(key)
  end

  def test_encrypt
    skip
    key = "02715"
    message = "hello world"
    @enigma.stubs(:get_date).returns("040895")

    actual = @enigma.encrypt(message, key, date)

    assert_instance_of Hash, actual
    assert_equal "keder ohulw", actual[encryption]
  end
end
