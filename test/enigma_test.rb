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
    expected = ("a".."z").to_a << " "
    assert_equal expected, @enigma.character_set
  end

  def test_random_five_digit_num
    assert_equal 5, @enigma.random_five_digit_num.length
  end

  def test_generate_keys
    assert_instance_of Hash, @enigma.generate_keys
    assert_equal 4, @enigma.generate_keys.length
    assert_equal 2, @enigma.generate_keys[:A].length
  end

  def test_get_date
    assert_instance_of String, @enigma.get_date
    assert_equal 6, @enigma.get_date.length
  end

  def test_generate_offsets
    assert_instance_of Hash, @enigma.generate_offsets
    assert_equal 4, @enigma.generate_offsets.length
  end

  def test_it_can_find_shifts
    assert_instance_of Hash, @enigma.find_shifts
    assert_equal 4, @enigma.find_shifts.length
  end

  def test_encrypt
    key = "03277320"
    date = "040895"
    # offsets = 1025
    # message = "hello world"

    actual = @enigma.encrypt("hello world", key, date)

    assert_instance_of Hash, actual
    assert_equal "keder ohulw", actual[encryption]
  end
end
