require './test/setup'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
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
    skip
    assert_instance_of Hash, @enigma.generate_offsets

  end

end
